# SwiftPods

SwiftPods brings pods and Swift Package Manager dependencies into one Podfile.
Declare both for your Apple project, install dependencies, and build with Xcode.

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

Open the generated `.xcworkspace` to build your app. Commit `Podfile`,
`Podfile.lock` and the project's `Package.resolved` to track pod and Swift package
versions. See the [Swift package guide](https://swiftpods.org/docs/swift-packages/).

## Updates and CI

```sh
brew upgrade swiftpods
swiftpods update Networking
swiftpods install --deployment
```

Release assets include architecture-specific archives, `release.json`, an
installer and SHA-256 checksums. For pinned installation and CI setup, see the
[installation guide](https://swiftpods.org/docs/#ci).
