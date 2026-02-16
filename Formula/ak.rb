class Ak < Formula
  desc "CLI/TUI tool for Artifact Keeper — an enterprise artifact registry"
  homepage "https://artifactkeeper.com"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.2.0/ak-darwin-arm64"
      sha256 "527b78a5a9c73bdce49ca9fb7f691ec9645825de4be2a19f973ee1ef9d3bda16"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.2.0/ak-darwin-amd64"
      sha256 "69c99ef01a39d8bc6adfca9637509cda0a9aace6f6399ef262bf7dd9924b6589"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.2.0/ak-linux-arm64"
      sha256 "925c3518ec08c50867862751f9a989072fc12a9f222e3b8e2d1ccb24dc9899c6"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.2.0/ak-linux-amd64"
      sha256 "358ff5e3e2fca3c5839459712b3c931de53870fc0301ebe981c2ddb0e2f845ad"
    end
  end

  def install
    bin.install Dir["ak*"].first => "ak"
  end

  test do
    assert_match "ak #{version}", shell_output("#{bin}/ak --version")
  end
end
