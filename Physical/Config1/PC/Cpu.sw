<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio FileVersion="4.9"?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="Main" Source="Main.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ModbusDriv" Source="ModbusDriver.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2" />
  <TaskClass Name="Cyclic#3" />
  <TaskClass Name="Cyclic#4" />
  <TaskClass Name="Cyclic#5" />
  <TaskClass Name="Cyclic#6" />
  <TaskClass Name="Cyclic#7" />
  <TaskClass Name="Cyclic#8" />
  <Libraries>
    <LibraryObject Name="AsOpcUas" Source="Libraries.AsOpcUas.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsOpcUac" Source="Libraries.AsOpcUac.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="runtime" Source="Libraries.runtime.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="Acp10man" Source="Libraries.Acp10man.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10par" Source="Libraries.Acp10par.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="NcGlobal" Source="Libraries.NcGlobal.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="standard" Source="Libraries.standard.lby" Memory="UserROM" Language="binary" Debugging="true" />
  </Libraries>
</SwConfiguration>