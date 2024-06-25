#Requires -Version 7
Using Module './fzf.psm1'

Function Select-GitCommit {
  Param (
    [String] $Query,
    [Int32] $MaxCount = 200
  )
  If (-Not (Get-Command fzf -ea SilentlyContinue)) {
    Throw "fzf not available"
  }
  $FzfParams = @()
  If ($Query) {
    $FzfParams = @('-q', $Query)
  }
  $Result = git --no-pager log `
      --pretty="format:%C(auto)%h %ad %s" `
      --date=short `
      --color `
      --max-count=${MaxCount} `
    | fzf --ansi @FzfParams
  Return ("$Result" -split ' ')[0]
}

Function Select-GitBranch($Query) {
  If (-Not (Get-Command fzf -ea SilentlyContinue)) {
    Throw "fzf not available"
  }
  $FzfParams = @()
  If ($Query) {
    $FzfParams = @('-q', $Query)
  }
  $Result =
    git for-each-ref refs/heads/ `
      --sort=-committerdate `
      --format='%(refname:short)' `
    | fzf @FzfParams
  Return ("$Result").Trim()
}

Function GitAdd {
  Param ([String]$Path = '--all')
  git add $Path
}

Function GitAddCommitPush {
  GitAdd && git commit -m "${args}" && git push
}

Function GitCheckout {
  Param ([String]$Branch)
  If (-Not $Branch) {
    $Branch = Select-GitBranch
  }
  While ($Branch) {
    & git checkout $Branch
    If ($LastExitCode) {
      $Branch = Select-GitBranch -Query $Branch
    } Else {
      $Branch = $Null
    }
  }
}

Function GitReset {
  Param ([String]$Commit, [Switch] $Hard)
  If (-Not $Commit) {
    $Commit = Select-GitCommit
  }
  $ResetType = $Hard ? '--hard' : '--soft'
  While ($Commit) {
    & git reset $ResetType $Commit
    If ($LastExitCode) {
      $Commit = Select-GitCommit -Query $Commit
    } Else {
      $Commit = $Null
    }
  }
}

