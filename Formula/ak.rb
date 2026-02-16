class Ak < Formula
  desc "CLI/TUI tool for Artifact Keeper — an enterprise artifact registry"
  homepage "https://artifactkeeper.com"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.1.0/ak-darwin-arm64"
      sha256 "3feeb08455baabbb8e06687ec5ae897848d3186e143236a1ba13c3f912bb843f"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.1.0/ak-darwin-amd64"
      sha256 "bd5ea3fe13338c2c83c93945062afde660784d48dbf41230ed812fc1def741b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.1.0/ak-linux-arm64"
      sha256 "30177ade879933ae6b308c11663d73f0d0deaf47848fab3c36fecf1a7476cc44"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.1.0/ak-linux-amd64"
      sha256 "5557430df0edffb794d85244e5dd0e38a56933bf24dccf7019b605a4443066fd"
    end
  end

  def install
    bin.install Dir["ak*"].first => "ak"
  end

  test do
    assert_match "ak #{version}", shell_output("#{bin}/ak --version")
  end
end
