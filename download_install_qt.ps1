$Wc = New-Object System.Net.WebClient ; `
$Wc.DownloadFile('https://download.qt.io/official_releases/qt/5.12/5.12.3/qt-opensource-windows-x86-5.12.3.exe', 'C:\qt.exe') ; 
Write-Output 'Downloaded QT Installer' ; `
$Env:QT_INSTALL_DIR = 'C:\\Qt' ; `
Start-Process C:\qt.exe -ArgumentList '--verbose --script windows/qtifwsilent.qs' -NoNewWindow -Wait ; `
Write-Output 'Installed QT Installer' ; `
Remove-Item C:\qt.exe -Force ; `
Remove-Item C:\qt\MaintenanceTool.exe -Force ; `
