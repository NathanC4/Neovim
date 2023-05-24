Set-Location C:\Tickets

Set-Alias -Name n -Value nvim-qt.exe
Set-Alias -Name c -Value createScriptArgs.pl
del alias:r
Set-Alias -Name r -Value runscript.pl
Set-Alias -Name g -Value my_getfile.pl
Set-Alias -Name o -Value createDirAndOpen
Set-Alias -Name ro -Value renameScriptForOverture.pl
Set-Alias -Name b -Value svnBranch.pl

Function createDirAndOpen {
    Param($x)
    mkdir $x
    cd $x
}
