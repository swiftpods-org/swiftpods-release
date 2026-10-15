class Swiftpods < Formula
  desc "Dependency manager for Apple platform projects"
  homepage "https://swiftpods.org"
  version "0.1.0-dev"
  depends_on :macos
  depends_on "ruby@3.4"
  skip_clean "libexec"
  depends_on arch: :arm64
  on_arm do
    url "https://github.com/swiftpods-org/swiftpods-release/releases/download/v0.1.0-dev/swiftpods-0.1.0-dev-macos-13.0-arm64.zip"
    sha256 "1ddbfead53db718164d9ba4cf833b15b317aa28070f5d2fb13b9817eab52ba3f"
  end

  def install
    minimum = {"arm64" => "13.0"}
    architecture = Hardware::CPU.arm? ? "arm64" : "x86_64"
    odie "No release for this architecture" unless minimum.key?(architecture)
    odie "Requires macOS #{minimum.fetch(architecture)} or newer" if MacOS.version < minimum.fetch(architecture)
    libexec.install Dir["*"]
    # Prevent Homebrew from moving verified metafiles out of libexec.
    (prefix/"README.md").write (libexec/"README.md").read
    (bin/"swiftpods").write_env_script libexec/"bin/swiftpods",
      SWIFTPODS_RUBY: Formula["ruby@3.4"].opt_bin/"ruby", SWIFTPODS_BUNDLE: libexec
    system bin/"swiftpods", "runtime", "verify", "--json"
  end

  test do
    assert_match "SwiftPods", shell_output("#{bin}/swiftpods --version")
    system bin/"swiftpods", "runtime", "verify", "--json"
  end
end
