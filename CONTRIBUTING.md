# Contributing

This project has adopted the [Microsoft Open Source Code of
Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct
FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com)
with any additional questions or comments.

## Best practices

* Use Windows PowerShell or [PowerShell Core][pwsh] (including on Linux/OSX) to run .ps1 scripts.
  Some scripts set environment variables to help you, but they are only retained if you use PowerShell as your shell.

## Prerequisites

All dependencies can be installed by running the `init.ps1` script at the root of the repository
using Windows PowerShell or [PowerShell Core][pwsh] (on any OS).
Some dependencies installed by `init.ps1` may only be discoverable from the same command line environment the init script was run from due to environment variables, so be sure to launch Visual Studio or build the repo from that same environment.
Alternatively, run `init.ps1 -InstallLocality Machine` (which may require elevation) in order to install dependencies at machine-wide locations so Visual Studio and builds work everywhere.

The only prerequisite for building, testing, and deploying from this repository
is the [.NET SDK](https://get.dot.net/).
You should install the version specified in `global.json` or a later version within
the same major.minor.Bxx "hundreds" band.
For example if 2.2.300 is specified, you may install 2.2.300, 2.2.301, or 2.2.310
while the 2.2.400 version would not be considered compatible by .NET SDK.
See [.NET Core Versioning](https://docs.microsoft.com/dotnet/core/versions/) for more information.

## Package restore

### NuGet restore

The easiest way to restore packages may be to run `init.ps1` which automatically authenticates
to the feeds that packages for this repo come from, if any.
`dotnet restore` or `nuget restore` also work but may require extra steps to authenticate to any applicable feeds.

### NPM install

The NPM packages built from this repo also require dependency installation.
`init.ps1` will install these dependencies automatically.

When a new package that is not already ingested by the NPM registry we use is required, authentication is required.
Create a `$HOME/.yarnrc.yml` file with the following content, substituting your actual personal access token from the `azure-public` AzDO account for the `PAT` placeholder in the file.
Note that this should be the original PAT, without any base64 encoding.

```yml
npmRegistries:
  //pkgs.dev.azure.com/azure-public/vside/_packaging/msft_consumption/npm/registry/:
    npmAuthIdent: devdiv:PAT
    npmAlwaysAuth: true
```

## Building

This repository can be built on Windows, Linux, and OSX.

### .NET code

Building, testing, and packing the .NET code in this repository can be done by using the standard dotnet CLI commands (e.g. `dotnet build`, `dotnet test`, `dotnet pack`, etc.).

### Typescript code

* Build: `yarn build`
* Test: `yarn test`
* Pack: `pack.ps1`

[pwsh]: https://docs.microsoft.com/powershell/scripting/install/installing-powershell?view=powershell-6
