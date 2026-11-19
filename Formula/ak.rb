class Ak < Formula
  desc "CLI/TUI tool for Artifact Keeper — an enterprise artifact registry"
  homepage "https://artifactkeeper.com"
  version "1.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.12.0/ak-darwin-arm64"
      sha256 "d9d80efb37c53562b263e08cb38541a2af6bba4146cfc2770db111b1c5e1c799"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.12.0/ak-darwin-amd64"
      sha256 "386967fe0d595f013b33a48d4f7329c5b0a1c3ac8bde6dd58a685e1c8ca9cd78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.12.0/ak-linux-arm64"
      sha256 "559d0897132bc0cf610916ac7b0ef477a7ffe2450d54157f7cf92274fb30736b"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.12.0/ak-linux-amd64"
      sha256 "cc8d7e2a480c207cf6e4489467fe258b16741fb50c3933798996b942c3cadefb"
    end
  end

  def install
    bin.install Dir["ak*"].first => "ak"
  end

  test do
    assert_match "ak #{version}", shell_output("#{bin}/ak --version")
  end
end
