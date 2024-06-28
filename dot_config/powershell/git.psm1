#Requires -Version 7
Using Module './fzf.psm1'

Filter ProcessGitOutputForFzf {
  If ($_ -Is [System.Management.Automation.ErrorRecord]) {
    If ($_ -Match 'fatal: (.*)') {
      Throw $Matches[1]
    } Else {
      Write-Error $_
    }
  }
  Else {
    Write-Output $_
  }
}

Function Select-GitCommit {
  Param (
    [String] $Query,
    [Int32] $MaxCount = 200
  )
  $Result = git --no-pager log `
      --pretty="format:%C(auto)%h (%Cblue%al%Creset)%C(auto)%d %s" `
      --color `
      --max-count=${MaxCount} `
    2>&1 `
    | ProcessGitOutputForFzf `
    | Select-Fzf -Ansi -Query $Query
  Return ("$Result" -split ' ')[0]
}

Function Select-GitBranch($Query) {
    git for-each-ref refs/heads/ `
      --sort=-committerdate `
      --format='%(refname:short)' `
    2>&1 `
    | ProcessGitOutputForFzf `
    | Select-Fzf -Query $Query
}

Function GitAdd {
  Param ([String]$Path = '--all')
  git add $Path @args
}

Function GitAddCommit {
  GitAdd && git commit -m "${args}"
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
    git checkout $Branch
    If ($LastExitCode) {
      $Branch = Select-GitBranch -Query $Branch
    } Else {
      $Branch = $Null
    }
  }
}

Function GitReset {
  [CmdletBinding(DefaultParameterSetName = 'Normal')]
  Param (
    [String] $Commit,

    [Parameter(ParameterSetName = 'Hard')]
    [Switch] $Hard,

    [Parameter(ParameterSetName = 'Soft')]
    [Switch] $Soft
  )

  If (-Not $Commit) {
    $Commit = Select-GitCommit
  }

  If ($Hard) {
    $ResetType = '--hard'
  }
  ElseIf ($Soft) {
    $ResetType = '--soft'
  }
  Else {
    $ResetType = @()
  }

  While ($Commit) {
    git reset $ResetType $Commit
    If ($LastExitCode) {
      $Commit = Select-GitCommit -Query $Commit
    } Else {
      $Commit = $Null
    }
  }
}

Function GitUnAdd {
  git restore --staged @args
}

Export-ModuleMember -Function @(
  'GitAdd'
  'GitAddCommit'
  'GitAddCommitPush'
  'GitCheckout'
  'GitReset'
  'GitUnAdd'
  'Select-GitBranch'
  'Select-GitCommit'
)
