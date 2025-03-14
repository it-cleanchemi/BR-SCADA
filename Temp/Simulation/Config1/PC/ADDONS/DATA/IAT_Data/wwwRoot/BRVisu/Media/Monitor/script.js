/*!
 * @overview 	Monitor Widget For OPCUA Variables
 * @version   	v1.1
 * @copyright 	Copyright (c) 2023, Tyler Carpenter
 * @license   	Licensed under MIT license
 * THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

	var dropdowns = [];
	var dataLengthSelect;
	var plots = [];
	var plotsLookup = [];
	var selections = [];
	var storedSelectionsJSON;
	try{
		storedSelectionsJSON = JSON.parse(window.localStorage.getItem('selections'));
		selections = storedSelectionsJSON;
	}
	catch(err){console.log(err);}

	const btnClear = document.getElementById("clear");
	btnClear.addEventListener("click", function () {
        newPlot();
	});

	var colors = ['#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF'];

	var backgroundColor = '#000000';
	var textColor 		= '#000000';

	var layout = {
					legend: {x: 0, y: 1},
					showlegend: true,
					paper_bgcolor: '#000000',
					plot_bgcolor: '#000000',
					font: {
						family: 'Arial, monospace',
						size: 18,
						color: '#FFFFFF'
					},
					xaxis: {
						gridcolor: '#FFFFFF',
						zerolinecolor: '#FFFFFF',
						linecolor: '#FFFFFF'
					},
					yaxis: {
						gridcolor: '#FFFFFF',
						zerolinecolor: '#FFFFFF',
						linecolor: '#FFFFFF'
					}
				}
	var config = {
					fillFrame: true,
					displaylogo: false, 
					responsive: true, 
					displayModeBar: true, 
					//modeBarButtonsToRemove: ['toImage']
				};

// Decode url and capture information such as the instance
	var urlParams;
	(window.onpopstate = function () {
		var match;
		var pl     = /\+/g;  // Regex for replacing addition symbol with a space
		var search = /([^&=]+)=?([^&]*)/g;
		var decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); };
		var query  = window.location.search.substring(1);
		urlParams = {};
		while (match = search.exec(query)){
		   urlParams[decode(match[1])] = decode(match[2]);
		}
		//console.log(urlParams);
		StartPLCComms();
	})();


// Start PLC comms
	var plcCommsData;
	function StartPLCComms()
	{
		// Calls for PLC
		plcCommsData = new HA_Comms(urlParams.instance,100);
		plcCommsData.start();
		// Check that first reads of plc are completed before drawing
		var checkCommsReady = setInterval(() => {
			if(plcCommsData.firstReadDone){
				clearInterval(checkCommsReady);
				for(var i=plcCommsData.nodes.length-1; i>=0; i--){
					if(plcCommsData.nodes[i].id.includes('Styles')){
						if (plcCommsData.nodes[i].id.includes('Styles.Text') && CSS.supports('color', plcCommsData.nodes[i].val)){
							layout.font.color = plcCommsData.nodes[i].val;
							textColor = plcCommsData.nodes[i].val;
						}
						else if (plcCommsData.nodes[i].id.includes('Styles.Background') && CSS.supports('color', plcCommsData.nodes[i].val)){
							layout.paper_bgcolor = plcCommsData.nodes[i].val;
							layout.plot_bgcolor = plcCommsData.nodes[i].val;
							backgroundColor = plcCommsData.nodes[i].val;
						}
						else if (plcCommsData.nodes[i].id.includes('Styles.GridColor') && CSS.supports('color', plcCommsData.nodes[i].val)){
							layout.xaxis.gridcolor = plcCommsData.nodes[i].val;
							layout.xaxis.zerolinecolor = plcCommsData.nodes[i].val;
							layout.xaxis.linecolor = plcCommsData.nodes[i].val;
							layout.yaxis.gridcolor = plcCommsData.nodes[i].val;
							layout.yaxis.zerolinecolor = plcCommsData.nodes[i].val;
							layout.yaxis.linecolor = plcCommsData.nodes[i].val;
						}
						else if (plcCommsData.nodes[i].id.includes('Styles.Line0') && CSS.supports('color', plcCommsData.nodes[i].val)){
							colors[0] = plcCommsData.nodes[i].val;
						}
						else if (plcCommsData.nodes[i].id.includes('Styles.Line1') && CSS.supports('color', plcCommsData.nodes[i].val)){
							colors[1] = plcCommsData.nodes[i].val;
						}
						else if (plcCommsData.nodes[i].id.includes('Styles.Line2') && CSS.supports('color', plcCommsData.nodes[i].val)){
							colors[2] = plcCommsData.nodes[i].val;
						}
						else if (plcCommsData.nodes[i].id.includes('Styles.Line3') && CSS.supports('color', plcCommsData.nodes[i].val)){
							colors[3] = plcCommsData.nodes[i].val;
						}
						plcCommsData.nodes.splice(i, 1);
					}
				}
				document.getElementById("clear").style.backgroundColor = backgroundColor;
				document.getElementById("clear").style.color = textColor;
				dataLengthSelect = document.getElementById("dataLength");
				dataLengthSelect.style.backgroundColor = backgroundColor;
				dataLengthSelect.style.color = textColor;
				document.getElementById("dataLengthOption_0").style.backgroundColor = backgroundColor;
				document.getElementById("dataLengthOption_0").style.color = textColor;
				document.getElementById("dataLengthOption_1").style.backgroundColor = backgroundColor;
				document.getElementById("dataLengthOption_1").style.color = textColor;
				document.getElementById("dataLengthOption_2").style.backgroundColor = backgroundColor;
				document.getElementById("dataLengthOption_2").style.color = textColor;

				for(var i=0; i<4; i++){
					dropdowns.push(document.getElementById("select_"+i));
					dropdowns[i].style.color = colors[i];
					dropdowns[i].style.backgroundColor = backgroundColor;
					var opt = document.createElement("option");
					opt.style.backgroundColor = backgroundColor;
					opt.style.color = textColor;
					opt.value = "unused";
					opt.textContent = "unused";
					dropdowns[i].appendChild(opt);
					for(var j=0; j<plcCommsData.nodes.length; j++){
						if(plcCommsData.nodes[j].val.length > 1){
							for(var k=0; k<plcCommsData.nodes[j].val.length; k++){
								var full = plcCommsData.nodes[j].id+'['+k+']';
								var txt = full.replace(urlParams.instance+'.', '');
								var opt = document.createElement("option");
								opt.style.backgroundColor = backgroundColor;
								opt.style.color = textColor;
								opt.value = full;
								opt.textContent = txt;
								dropdowns[i].appendChild(opt);
							}
						}
						else{
							var full = plcCommsData.nodes[j].id;
							var txt = full.replace(urlParams.instance+'.', '');
							var opt = document.createElement("option");
							opt.style.backgroundColor = backgroundColor;
							opt.style.color = textColor;
							opt.value = full;
							opt.textContent = txt;
							dropdowns[i].appendChild(opt);
						}
					}
				}
				newPlot();
				setInterval(() => {
					Update();
				},plcCommsData.cyclic);
			}
		},1000);
	}
	function checkDropdowns() {
		for(var i=0; i<4; i++){
			if(selections[i] != dropdowns[i].value){
				return true;
			}
		}
		return false;
	}
	var first = true
	function newPlot() {
		plots = [];
		plotsLookup = [];
		if(first){
			if(selections != null){
				for(var i=0; i<4; i++){
					dropdowns[i].value = selections[i];
				}
			}
			first = false;
		}
		selections = [];
		for(var i=0; i<4; i++){
			selections.push(dropdowns[i].value);
			if(selections[i] != 'unused'){
				plots.push({y: [],mode: 'lines',line: {color: colors[i], 'shape': 'spline',  'smoothing': 0.2}, name: selections[i].replace(urlParams.instance+'.', '')});
				plotsLookup.push(selections[i]);
			}
		}
		var selectionsJSON = JSON.stringify(selections);
		window.localStorage.setItem('selections', selectionsJSON);
		if(plots.length > 0){
			Plotly.newPlot('graph', plots, layout, config);
		}
		else{
			Plotly.newPlot('graph', [{y: [],mode: 'lines',line: {'color': colors[0], 'shape': 'spline',  'smoothing': 0.2}}], layout, config);
		}
	}
	function extendPlot() {
		var plotIndices = [];
		var plotArr = [];
		for(var i=0; i<plots.length; i++){
			plotIndices.push(i);
			if(plotsLookup[i].includes('[')){
				var tempString = plotsLookup[i].split('[')[0];
				var tempArray = plotsLookup[i].split('[')[1].split(']')[0];
				plotArr.push([plcCommsData.getValueById(tempString)[tempArray]]);
			}
			else {
				plotArr.push([plcCommsData.getValueById(plotsLookup[i])]);
			}
			while (plots[i].y.length > dataLengthSelect.value){
				plots[i].y.shift();
			}
		}
		Plotly.extendTraces('graph', {y: plotArr}, plotIndices);

	}
	function Update()
	{
		try
		{
			if(checkDropdowns()){
				newPlot();
			}
			if(plots.length > 0){
				extendPlot()
			}
		}
		catch(err)
		{
			console.log(err);
		}
	}