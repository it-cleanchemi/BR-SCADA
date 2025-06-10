<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio FileVersion="4.9"?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="ModMaster_" Source="modbusTCP.ModMaster_LR.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ModbusDriv" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2">
    <Task Name="Vis" Source="Vis.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#3" />
  <TaskClass Name="Cyclic#4">
    <Task Name="Services" Source="Services.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#5" />
  <TaskClass Name="Cyclic#6" />
  <TaskClass Name="Cyclic#7" />
  <TaskClass Name="Cyclic#8" />
  <DataObjects>
    <DataObject Name="Acp10sys" Source="" Memory="UserROM" Language="Binary" />
  </DataObjects>
  <Binaries>
    <BinaryObject Name="FWRules" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="TCData" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="mvLoader" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="udbdef" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="TCLang" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="acp10cfg" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arnc0cfg" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Acp10map" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="ashwac" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="User" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Role" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="TC" Source="" Memory="UserROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="AsOpcUas" Source="Libraries.AsOpcUas.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsOpcUac" Source="Libraries.AsOpcUac.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="runtime" Source="Libraries.runtime.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="NcGlobal" Source="Libraries.NcGlobal.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="standard" Source="Libraries.standard.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="MbusTCP" Source="modbusTCP.MbusTCP.lby" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <LibraryObject Name="IDEC_Real" Source="modbusTCP.IDEC_Real.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="astime" Source="Libraries.astime.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsIecCon" Source="Libraries.AsIecCon.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsTCP" Source="Libraries.AsTCP.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsBrStr" Source="Libraries.AsBrStr.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsARCfg" Source="Libraries.AsARCfg.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="sys_lib" Source="Libraries.sys_lib.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="ArTextSys" Source="Libraries.ArTextSys.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="Str2DtPvdr" Source="Libraries.Str2DtPvdr.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="powerlnk" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="arssl" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="asstring" Source="Libraries.asstring.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsBrWStr" Source="Libraries.AsBrWStr.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="MpCom" Source="Libraries.MpCom.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MpBase" Source="Libraries.MpBase.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="HA" Source="Libraries.HA.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="HA_Version" Source="Libraries.HA_Version.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="HA_IO" Source="Libraries.HA_IO.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="HA_Dir" Source="Libraries.HA_Dir.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="HA_Convert" Source="Libraries.HA_Convert.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="HA_AlarmX" Source="Libraries.HA_AlarmX.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="HA_ItemX" Source="Libraries.HA_ItemX.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="HA_RAND" Source="Libraries.HA_RAND.lby" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <LibraryObject Name="ArEventLog" Source="Libraries.ArEventLog.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="ArProject" Source="Libraries.ArProject.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="brsystem" Source="Libraries.brsystem.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="FileIO" Source="Libraries.FileIO.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsUSB" Source="Libraries.AsUSB.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="HA_Array" Source="Libraries.HA_Array.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="HA_SysErr" Source="Libraries.HA_SysErr.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="MpAlarmX" Source="Libraries.MpAlarmX.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="IDEC_Strng" Source="modbusTCP.IDEC_Strng.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="MpUserX" Source="Libraries.MpUserX.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsHttp" Source="Libraries.AsHttp.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsICMP" Source="Libraries.AsICMP.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsHost" Source="Libraries.AsHost.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="HA_JSON" Source="modbusTCP.HA_JSON.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="HA_Str" Source="Libraries.HA_Str.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="ArUser" Source="Libraries.ArUser.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="API_Login" Source="Libraries.API_Login.lby" Memory="UserROM" Language="IEC" Debugging="true" />
  </Libraries>
</SwConfiguration>