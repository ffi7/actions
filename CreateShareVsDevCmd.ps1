# 用户快捷方式目录，系统快捷方式目录
$UserPrograms = "$env:UserProfile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
$SystemPrograms = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs"

# Visual Studio 开发者命令行脚本快捷方式地址
$VsDevCmdLnk = Get-ChildItem -Path $UserPrograms -Filter "Developer Command Prompt for VS *.lnk" -Recurse | Select-Object -ExpandProperty FullName
if (-not $VsDevCmdLnk) {
    $VsDevCmdLnk = Get-ChildItem -Path $SystemPrograms -Filter "Developer Command Prompt for VS *.lnk" -Recurse | Select-Object -ExpandProperty FullName
}

# Visual Studio Code快捷方式地址
$CodeLnk = Get-ChildItem -Path $UserPrograms -Filter  "Visual Studio Code.lnk" -Recurse | Select-Object -ExpandProperty FullName
if (-not $CodeLnk) { 
    Get-ChildItem -Path $SystemPrograms -Filter  "Visual Studio Code.lnk" -Recurse | Select-Object -ExpandProperty FullName 
}

# WScript.Shell 对象
$CrShell = New-Object -ComObject WScript.Shell

# Visual Studio 开发者命令行脚本地址
$VsDevCmd = Get-ChildItem -Path $VsDevCmdLnk -File | ForEach-Object {
    $CrShell.CreateShortcut($_.FullName).Arguments -replace "(/k)", "" 
}

# Visual Studio Code 快捷方式对象
$VsCode = Get-ChildItem -Path $CodeLnk -File | ForEach-Object {
    $CrShell.CreateShortcut($_.FullName) 
}

# 将创建的 Visual Studio Code 开发者命令行脚本地址
$CodeDevCmd = ($VsCode.WorkingDirectory + "\VsDevCmd.bat")

# 指定输出编码，PowerShell 默认为 UTF-16LE
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'

# 创建脚本
#  禁止回显
#  指定编码
#  引用 Visual Studio 开发者命令行脚本
#  启动 Visual Studio Code
#  退出终端
Write-Output	"@echo off"> $CodeDevCmd
Write-Output	"chcp 65001 > nul" >> $CodeDevCmd
Write-Output	"call $VsDevCmd" >> $CodeDevCmd
Write-Output	"start """" code" >> $CodeDevCmd
Write-Output	"exit /B 0" >> $CodeDevCmd

Write-Output "脚本创建成功: $CodeDevCmd"

$Desktop = $CrShell.SpecialFolders("Desktop")

$Shortcut = $CrShell.CreateShortcut("$Desktop\Visual Studio Code.lnk")
$Shortcut.WorkingDirectory = $VsCode.WorkingDirectory
$Shortcut.IconLocation = $VsCode.TargetPath
$Shortcut.TargetPath = $CodeDevCmd

$Shortcut.Save()

Write-Output ("链接创建成功: " + $Shortcut.FullName)
