# BR-SCADA
Repository for B&amp;R Automation code
This the the GitHub for the remote monitoring and/or SCADA system. The code is done in xml and is intended to be used to generate pages and templates within the B&amp; Automation Software.
The link to this software is: __________. 

For further questions, feel free to reach out to Chris Pollaci at c.pollaci@cleanchemi.com. 

For any issues with the B&amp;R Automation software, please reach out to B&amp;R Automation support.
The link to this site is: ____________. 


Folders: 
BRAutomationFiles: 
  - This is a copy of the local files on my PC for the Developer environment for B&amp;R Automation files. 
  - These can be used if the entire project is deleted somehow to restore the project to the last saved state.
  - In this scenario, you can download the entire folder to replicate the lost project, and open it in the B&amp;R Automation application

XMLFiles: 
  - These Files are the raw xml data that is programmed into B&amp;R Automation for the graphical scada side. 
  - These can be used for new projects so that the entire template does not need to be started from scratch.
  - These files do NOT have any variables linking configured. This will need to be done manually in the B&amp;R Automation application after copying them over
  - The easiest way to use these is to perform the following steps in B&amp;R Automation application:
    1. Create a new "Content" or "Page" file in the logical view editor under "Visualization" or a new "Widget" under the "Widget Lab"
    2. After creating the "Content, Page, or Widget", right click and select "Open as XML"
    3. Copy the Git File text that properly cooresponds to the new object you are creating.
    4. Paste the file over ALL the text in the opened XML in B&amp;R Automation code.
    5. Save and Compile the code in B&amp;R Automation. Ensure there are no errors.
   
  
