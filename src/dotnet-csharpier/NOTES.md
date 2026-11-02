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
