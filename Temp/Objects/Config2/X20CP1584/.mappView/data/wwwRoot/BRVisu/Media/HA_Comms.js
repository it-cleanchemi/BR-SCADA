/*!
 * @overview 	Helper library for Mappview OPCUA service functions
 * @version   	v1.1
 * @copyright 	Copyright (c) 2022, Tyler Carpenter
 * @license   	Licensed under MIT license
 * THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

	class HA_Comms {
		constructor(filter, cyclic) {
			this.searchString = filter;
			// this.filter = new RegExp(filter);
			this.cyclic = cyclic;
			this.nodes = [];
			this.browseActive = false;
			this.browseDone = false;
			this.firstReadDone = false;
			this.newData = false;
			this.browseCount = 0;
			this.checkBrowseIntervalId = null;
			this.readTimeoutId = null;
		}
		start(){
			this.nodes = [];

			var self = this;
			parent.brease.services.opcua.browse(this.searchString).done(
				function(value){
					self._browseFilterResult(value);
				},function(){}
			);

			this.checkBrowseIntervalId = setInterval(() => {
				if(this.browseActive && this.browseCount == 0){
					clearInterval(this.checkBrowseIntervalId);
					this.browseActive = false;
					this.browseDone = true;
					this._readPLC(this);
				}	
			}, 10);
		}

		getValueById(id) {
			for (var i = 0; i < this.nodes.length; i++){
				if(this.nodes[i].id === id){
					return this.nodes[i].val;
				}
			}
			return null;
		}

	// Internal Functions
		_readPLC(self){
			var arr = [];
			for (var i = 0; i < self.nodes.length; i++){
				arr.push({nodeId : self.nodes[i].id, attributeId: 13});
			}
			parent.brease.services.opcua.read(arr).done(
			function(value) 
			{ 
				try
				{
					for (var i = 0; i < arr.length; i++){
						if (JSON.stringify(self.nodes[i].val) != JSON.stringify(value.results[i].value)){ 
							self.newData = true;
						}
						self.nodes[i].val = value.results[i].value;;
					}
					self.firstReadDone = true;
				}
				catch(err) {console.log(err);}
				this.readTimeoutId = setTimeout(function() { self._readPLC(self) },self.cyclic);
			},function(){});
		}
		_browse(id){
			var self = this;
			parent.brease.services.opcua.browse(id).done(
				function(value){
					self.browseCount--;
					self._browseFilterResult(value);
				},function(){}
			);
		}
		_browseFilterResult(result) {
			try{
				for (var i = 0; i < result.referenceDescriptions.length; i++){
					// ignore browse results that are not namespace 6 or if they are a typ definition
					if (result.referenceDescriptions[i].browseName.includes("NS6") && !result.referenceDescriptions[i].nodeId.includes("_typ")){	
						// create substring from OPCUA variable name
						var subString = result.referenceDescriptions[i].nodeId.split("|")[2];	
						// if array is not blank search current array and remove the incomplete parent of current substring if found
						if (this.nodes[0] != undefined){
							for (var j = 0; j < this.nodes.length; j++){
								if (subString.includes(this.nodes[j].id + ".") || subString.includes(this.nodes[j].id + "[") || subString.includes(this.nodes[j].id + ":")){
									// remove this index and exit the FOR loop
									this.nodes.splice(j,1);
									break;
								}
							}
						}
						// add substring to node list and continue browsing the tree
						this.nodes.push({id:subString,val:null});
						this.browseCount++;
						this.browseActive = true;
						this._browse(subString);
					}
				}
			}
			catch(err){console.log(err)}
		}
	}