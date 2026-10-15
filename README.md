# SwiftPods

SwiftPods is a dependency manager for Apple platform projects. Describe your
dependencies in a Podfile, install them, and build your app in Xcode.

[Website](https://swiftpods.org) ·
[Releases](https://github.com/swiftpods-org/swiftpods-release/releases) ·
[Documentation](https://swiftpods.org/docs/)

## Installation

```sh
brew install swiftpods
```

Homebrew installs a compatible Ruby as a separate dependency.

```sh
swiftpods install
```

Open the generated `.xcworkspace` to build your app. Commit `Podfile` and
`Podfile.lock` so your team uses the same dependency versions.

## Updates and CI

```sh
brew upgrade swiftpods
swiftpods update Networking
swiftpods install --deployment
```

Release assets include architecture-specific archives, `release.json`, an
installer and SHA-256 checksums. For pinned installation and CI setup, see the
[installation guide](https://swiftpods.org/docs/#ci).
