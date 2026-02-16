class Ak < Formula
  desc "CLI/TUI tool for Artifact Keeper — an enterprise artifact registry"
  homepage "https://artifactkeeper.com"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.3.0/ak-darwin-arm64"
      sha256 "c98febb7a84c38125c0bfc042c7a70cd021b171052ae66bdb72f384c107c24da"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.3.0/ak-darwin-amd64"
      sha256 "3aee6fd4f670064cc5c24adaae59b676d57fad09a2759e2cab7e60e133ed72b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.3.0/ak-linux-arm64"
      sha256 "6e25decce85d5bfc30f18cacf127da746fb400446677c6a73fc10db9d03581f1"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.3.0/ak-linux-amd64"
      sha256 "0c16c4dc959291217ed9d6155bdfd98014d269cea7e949163e1d2ca8c9e30543"
    end
  end

  def install
    bin.install Dir["ak*"].first => "ak"
  end

  test do
    assert_match "ak #{version}", shell_output("#{bin}/ak --version")
  end
end
