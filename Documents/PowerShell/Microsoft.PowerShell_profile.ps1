Set-Location 'C:\MDC Git\Accounts'
Set-Location 'C:\MDC Git\Accounts'
# test

Import-Module posh-git
$GitPromptSettings.EnableFileStatus = $false

# oh-my-posh.exe init pwsh --config '~\ohmyposh.omp.json' | Invoke-Expression

Set-Alias -Name n -Value nvim-qt.exe
Set-Alias -Name c -Value createScriptArgs.pl
del alias:r
Set-Alias -Name r -Value runscript.pl
Set-Alias -Name g -Value my_getfile.pl
Set-Alias -Name o -Value createDirAndOpen
Set-Alias -Name ro -Value renameScriptForOverture.pl
Set-Alias -Name b -Value svnBranch.pl

Function goac { Set-Location -Path 'C:\MDC Git\Accounts' }
Function goar { Set-Location -Path 'C:\MDC Git\Aria' }
Function gofr { Set-Location -Path 'C:\MDC Git\Framework' }
Function goti { Set-Location -Path 'C:\Tickets' }

Function gitvim {
    cd ~
    git commit -a -m "vim"
    git push
}

Function createDirAndOpen {
    Param($x)
    mkdir $x
    cd $x
}
