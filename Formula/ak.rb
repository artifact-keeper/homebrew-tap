class Ak < Formula
  desc "CLI/TUI tool for Artifact Keeper — an enterprise artifact registry"
  homepage "https://artifactkeeper.com"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.1/ak-darwin-arm64"
      sha256 "c159e646c59b49922c9eb235018a89cae2652d5c4a08a447fb136e4b7156245a"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.1/ak-darwin-amd64"
      sha256 "f8fdf334b974558e19e9ae4ce3811833d2e93d7306b3d3355062d93f7df6ad41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.1/ak-linux-arm64"
      sha256 "3afa617977ab9cf5d97647ff3f4d857f101fef32e193540409775d04576bc73a"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.1/ak-linux-amd64"
      sha256 "e6870d5163df3e90ead990cd39bd6990a6d3b96ae1f811339f60ad679ff3ea26"
    end
  end

  def install
    bin.install Dir["ak*"].first => "ak"
  end

  test do
    assert_match "ak #{version}", shell_output("#{bin}/ak --version")
  end
end
