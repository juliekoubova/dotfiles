Using Namespace System.Security.Principal

Function Test-IsAdmin {
  $Identity = [WindowsIdentity]::GetCurrent()
  $Principal = [WindowsPrincipal]::new($Identity)
  $Principal.IsInRole([WindowsBuiltInRole]::Administrator)
  $Identity.Dispose()
}
