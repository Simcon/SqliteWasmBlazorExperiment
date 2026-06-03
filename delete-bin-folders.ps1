# Recursively delete all bin and obj folders
Get-ChildItem .\Src -include bin,obj -Recurse | foreach ($_) { remove-item $_.fullname -Force -Recurse }
