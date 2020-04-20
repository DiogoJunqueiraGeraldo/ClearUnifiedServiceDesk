# @Author: Diogo Junqueira Geraldo
# @Version: 2.0 04/20/2020

$mirrorProcesses = Get-Process;
$targetProcesses = @('usd', 'UnifiedServiceDesk');

foreach($mirrorProcess in $mirrorProcesses) {
    foreach($targetProcess in $targetProcesses){
        if ($mirrorProcess.Name.StartsWith($targetProcess)) {
            Get-Process $mirrorProcess.Name -ErrorAction SilentlyContinue | Stop-Process;
        }
    }
}

$paths = @(($env:APPDATA + '\Microsoft\USD'),($env:LOCALAPPDATA + '\Microsoft\UnifiedServiceDesk'));
foreach($path in $paths) {
    Remove-Item -Force -Recurse "$path\*";
}

Start-Process ($env:ProgramFiles + '\Microsoft Dynamics CRM USD\USD\UnifiedServiceDesk.exe');