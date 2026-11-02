
# .NET CSharpier (dotnet-csharpier)

Installs the CSharpier. See: https://csharpier.com/docs/About

## Example Usage

```json
"features": {
    "ghcr.io/NikiforovAll/devcontainer-features/dotnet-csharpier:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the CSharpier version you would like to install | string | latest |

## Requirements

This feature needs the .NET SDK. Use an image that has .NET, or add the dotnet feature:

```json
"image": "mcr.microsoft.com/devcontainers/dotnet:2-10.0",
"features": {
    "ghcr.io/nikiforovall/devcontainer-features/dotnet-csharpier:2": {}
}
```

```json
"image": "mcr.microsoft.com/devcontainers/base:ubuntu",
"features": {
    "ghcr.io/devcontainers/features/dotnet:2": {},
    "ghcr.io/nikiforovall/devcontainer-features/dotnet-csharpier:2": {}
}
```

CSharpier is installed to `/usr/local/share/dotnet-tools`, which is on `PATH` for all users. Run it with `csharpier`.

## Upgrading from 1.x

Version 2.0.0 no longer installs the dotnet feature for you. If your image does not have .NET, add `ghcr.io/devcontainers/features/dotnet:2` to `features`.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/NikiforovAll/devcontainer-features/blob/main/src/dotnet-csharpier/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
