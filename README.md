# BR-SCADA
Repository for B&amp;R Automation code
This is the GitHub for the remote monitoring and/or SCADA system. The code primarily in xml and is intended to be used to generate pages and templates within the B&amp;R Automation Software.
The link to this software is: [(https://www.br-automation.com/)]. 

For further questions, feel free to reach out to Chris Pollaci at c.pollaci@cleanchemi.com. 

For any issues with the B&amp;R Automation software, please reach out to B&amp;R Automation support.
The link to this site is: ____________. 

# Adding New Modbus Variables into BR Automation
To add variables into the B&amp;R Automation software, first open the project you are working on, or create a new project. 
Then follow these steps:
  - Navigate to the "Physical View". This should contain a drop down labeled "ETH"
  - From "ETH" Select the data source that you would like to add data to. This corresponds to Skid/Secomea IPs
  - Right click on it and select "Configuration"
  - From this window, go to "Channel configuration"
  - You will see several "blocks" each one of these is associated with a read/write variable
  - Go to the bottom most block that will appear greyed out
  - Set the "Function Code" as "FC3" for write, and "FC6" for read Variables
  - Set the "Starting Address" as the place in memory that the data point is stored in the PLC
  - Under "Channel 1" set the "Name" as the variable name. For Write addresses, alter the format like so: p101_sp to P101SP
      - This is so that they have different names within the software to prevent them from getting mixed up
  - Select the Data Type to coorespond to the PLC
  - You have successfully added a new modbus variable from the PLC to the B&ampR; Automation Studio
