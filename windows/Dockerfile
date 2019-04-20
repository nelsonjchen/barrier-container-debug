# escape=`

FROM mcr.microsoft.com/windows/servercore:ltsc2019 

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN $url = 'https://download.visualstudio.microsoft.com/download/pr/10930955/e64d79b40219aea618ce2fe10ebd5f0d/vs_BuildTools.exe'; `
    $sha256 = '68A678D64704A4592CA003494B9C128EE5D2B381672DE174BAF9811E2A84EE72'; `
    Invoke-WebRequest -Uri $url -OutFile C:\vs_BuildTools.exe; `
    $actual256 = (Get-FileHash vs_BuildTools.exe -Algorithm sha256).Hash; `
    if ($actual256 -ne $sha256) { `
       Write-Host 'FAILED!'; `
       Write-Host ('expected: {0}' -f $sha256); `
       Write-Host ('got:      {0}' -f $actual256); `
       exit 1; `
    };    

RUN Start-Process -filepath C:\vs_buildtools.exe -passthru -wait -argumentlist `
    '--add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --quiet --nocache --wait'; `
    Remove-Item C:\vs_BuildTools.exe; `
    Remove-Item -Force -Recurse 'C:\\Program Files (x86)\\Microsoft Visual Studio\\Installer'
