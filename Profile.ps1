Using Module 'posh-git'
Using Module 'oh-my-posh'
Using Module '.\SearchPath.psm1'
Using Module '.\VCPkg.psm1'

Set-PoshPrompt -Theme zash

$VcpkgRepo = Select-Vcpkg
If ($VcpkgRepo){
    Import-Module "${VcpkgRepo}\scripts\posh-vcpkg"
}

Function wip {
    & git add -A
    If ($?) {
        & git commit -m wip
    }
}

Function Test-GitWorkingTreeDirty {
    Return [Boolean]$(& git status --short)
}

Function squash {
    Param (
        [Parameter(Position = 0, Mandatory)]
        [String] $Branch
    )

    If (Test-GitWorkingTreeDirty) {
        & git status
        Throw "Git working tree is not clean"
    }

    & git reset $(git merge-base $Branch HEAD)
    If (-Not $?) { Throw }

    & git add -A
    If (-Not $?) { Throw }

    & git commit -m squash
    If (-Not $?) { Throw }
}

Function rebase {
    Param (
        [Parameter(Position = 0, Mandatory)]
        [String] $Branch
    )

    & git fetch
    If (-Not $?) { Throw }

    & squash $Branch

    & git rebase --interactive $Branch
    If (-Not $?) { Throw }
}