SHELL := cmd.exe
CYGWIN=nontsec
export PATH := C:\windows\system32;C:\windows;C:\windows\System32\Wbem;C:\windows\System32\WindowsPowerShell\v1.0\;C:\Program Files\HP\HP One Agent;C:\Users\Chris\AppData\Local\Programs\Python\Launcher\;C:\Users\Chris\AppData\Local\Microsoft\WindowsApps;C:\Users\Chris\AppData\Local\Programs\Microsoft VS Code\bin;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\Chris\AppData\Local\Programs\Python\Launcher\;C:\Users\Chris\AppData\Local\Microsoft\WindowsApps;C:\Users\Chris\AppData\Local\Programs\Microsoft VS Code\bin;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\Chris\AppData\Local\GitHubDesktop\bin;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.12;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.11;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.10;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.9;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.8;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.7;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.6;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.5;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.4;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.3;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.2;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.1;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en\4.0;C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en
export AS_BUILD_MODE := Build
export AS_VERSION := 4.12.6.106
export AS_WORKINGVERSION := 4.12
export AS_COMPANY_NAME := HP
export AS_USER_NAME := Chris
export AS_PATH := C:/Users/Chris/OneDrive/Desktop/BRAutomation/AS412
export AS_BIN_PATH := C:/Users/Chris/OneDrive/Desktop/BRAutomation/AS412/bin-en
export AS_PROJECT_PATH := C:/projects/BR-SCADA
export AS_PROJECT_NAME := CleanChemi_SiteManagementSystem
export AS_SYSTEM_PATH := C:/Users/Chris/OneDrive/Desktop/BRAutomation/AS/System
export AS_VC_PATH := C:/Users/Chris/OneDrive/Desktop/BRAutomation/AS412/AS/VC
export AS_TEMP_PATH := C:/projects/BR-SCADA/Temp
export AS_CONFIGURATION := Config1
export AS_BINARIES_PATH := C:/projects/BR-SCADA/Binaries
export AS_GNU_INST_PATH := C:/Users/Chris/OneDrive/Desktop/BRAutomation/AS412/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH := C:/Users/Chris/OneDrive/Desktop/BRAutomation/AS412/AS/GnuInst/V4.1.2/4.9/bin
export AS_GNU_INST_PATH_SUB_MAKE := C:/Users/Chris/OneDrive/Desktop/BRAutomation/AS412/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH_SUB_MAKE := C:/Users/Chris/OneDrive/Desktop/BRAutomation/AS412/AS/GnuInst/V4.1.2/4.9/bin
export AS_INSTALL_PATH := C:/Users/Chris/OneDrive/Desktop/BRAutomation/AS412
export WIN32_AS_PATH := "C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412"
export WIN32_AS_BIN_PATH := "C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\bin-en"
export WIN32_AS_PROJECT_PATH := "C:\projects\BR-SCADA"
export WIN32_AS_SYSTEM_PATH := "C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS\System"
export WIN32_AS_VC_PATH := "C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\AS\VC"
export WIN32_AS_TEMP_PATH := "C:\projects\BR-SCADA\Temp"
export WIN32_AS_BINARIES_PATH := "C:\projects\BR-SCADA\Binaries"
export WIN32_AS_GNU_INST_PATH := "C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\AS\GnuInst\V4.1.2"
export WIN32_AS_GNU_BIN_PATH := "C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412\AS\GnuInst\V4.1.2\bin"
export WIN32_AS_INSTALL_PATH := "C:\Users\Chris\OneDrive\Desktop\BRAutomation\AS412"

.suffixes:

ProjectMakeFile:

	@'$(AS_BIN_PATH)/4.9/BR.AS.AnalyseProject.exe' '$(AS_PROJECT_PATH)/CleanChemi_SiteManagementSystem.apj' -t '$(AS_TEMP_PATH)' -c '$(AS_CONFIGURATION)' -o '$(AS_BINARIES_PATH)'   -sfas -buildMode 'Build'   

