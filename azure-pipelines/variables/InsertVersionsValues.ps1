# When you need binding redirects in the VS repo updated to match
# assemblies that you build here, remove the "return" statement
# and update the hashtable below with the T4 macro you'll use for
# your libraries as defined in the src\ProductData\AssemblyVersions.tt file.

$MacroName = 'MicrosoftServiceHubFrameworkVersion'
$SampleProject = "$PSScriptRoot\..\..\src\Microsoft.ServiceHub.Framework"
[string]::join(',',(@{
    ($MacroName) = & { (dotnet tool run nbgv -- get-version --project $SampleProject --format json | ConvertFrom-Json).AssemblyVersion };
}.GetEnumerator() |% { "$($_.key)=$($_.value)" }))
