class Ak < Formula
  desc "CLI/TUI tool for Artifact Keeper — an enterprise artifact registry"
  homepage "https://artifactkeeper.com"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.0/ak-darwin-arm64"
      sha256 "eb060ab76f23d4577b3a40ec8a80e7828e580c0077ea60e900b987be90ebb8a4"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.0/ak-darwin-amd64"
      sha256 "8e6ade3ccf9c6ef63e3e299a7544c16f4900f59900ad51841570ee0a54c91db4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.0/ak-linux-arm64"
      sha256 "e120dd826f113b2c7227a3718ba252221aa1e4a5a4d9a3cc53137c92db68ee9c"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.0/ak-linux-amd64"
      sha256 "08a939268bdcde6a80dd56ba815f50fb2471bd8455e70a306f23a0d8f825f541"
    end
  end

  def install
    bin.install Dir["ak*"].first => "ak"
  end

  test do
    assert_match "ak #{version}", shell_output("#{bin}/ak --version")
  end
end
