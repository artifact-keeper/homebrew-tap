class Ak < Formula
  desc "CLI/TUI tool for Artifact Keeper — an enterprise artifact registry"
  homepage "https://artifactkeeper.com"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.2/ak-darwin-arm64"
      sha256 "194a3607c5e8ec4f5daab57d2f6f5dce5a6ce4621c20f800fc4153e8f708a8c9"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.2/ak-darwin-amd64"
      sha256 "984c3fc866f9d294dda5bad3e155d5f05a982f1523d7e0a7a88716bbbed0298e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.2/ak-linux-arm64"
      sha256 "1c5b1b53af7c60fb87de28d4e95df5f9626ff999e60fc984febf97d6bc543d34"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.2/ak-linux-amd64"
      sha256 "26628931c3df2182ba3359c362677cbc2eeaa8ca06d895b0bbd4b2819fc73fd8"
    end
  end

  def install
    bin.install Dir["ak*"].first => "ak"
  end

  test do
    assert_match "ak #{version}", shell_output("#{bin}/ak --version")
  end
end
