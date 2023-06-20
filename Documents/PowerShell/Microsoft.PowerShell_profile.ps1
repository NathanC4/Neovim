Set-Location 'C:\MDC Git\Accounts'
Set-Location 'C:\MDC Git\Accounts'

Import-Module posh-git
$GitPromptSettings.EnableFileStatus = $false
$GitPromptSettings.BeforeStatus.ForegroundColor = 'default'
$GitPromptSettings.AfterStatus.ForegroundColor = 'default'
$GitPromptSettings.BranchColor.ForegroundColor = '0x16c60c' # Campbell bright green

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
Function gos { Set-Location -Path 'C:\MDC Git\SVN-Archive\accounts' }
Function st { git status }

function gs
{
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [ArgumentCompleter({
            param($pCmd, $pParam, $pWord, $pAst, $pFakes)

            $branchList = (git branch --format='%(refname:short)')

            if ([string]::IsNullOrWhiteSpace($pWord)) {
                return $branchList;
            }

            $branchList | Select-String "$pWord"
        })]
        [string] $branch
    )

    git checkout $branch;
}

Function gitvim {
    cd ~
    git commit -am "configs"
    git push
}

# Delete local branches that have been merged into main
Function gitclean {
    git switch main | git branch --merged | %{$_.trim()}  | ?{$_ -notmatch 'dev' -and $_ -notmatch 'master' -and $_ -notmatch 'main'} | %{git branch -d $_.trim()}
}

# Git pull recursively
Function pullrec {
    Get-ChildItem -Directory -Force -Recurse *.git | ForEach-Object { cd $_.Parent.FullName; Write-Host $_.Parent.FullName; git pull }
}

Function createDirAndOpen {
    Param($x)
    mkdir $x
    cd $x
}
