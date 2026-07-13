class Ak < Formula
  desc "CLI/TUI tool for Artifact Keeper — an enterprise artifact registry"
  homepage "https://artifactkeeper.com"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.2.0/ak-darwin-arm64"
      sha256 "73ff493fd44d0cf20478f5e9902b5b67b6d9ec1172474a7c49896b199a1bfc5d"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.2.0/ak-darwin-amd64"
      sha256 "443ad5b436a4db59cd57de19f37153e21401ea42e6e554512f6ed97f57ef8917"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.2.0/ak-linux-arm64"
      sha256 "fc28eb8ce7305d5463356dc4dd1733bd406b2dfe9bb5cc6c772c8ef026ee49e7"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.2.0/ak-linux-amd64"
      sha256 "20fbd303ae8ccfd018bb3423091d3792acbdfa17fc2bb1df9f355086e894bdf9"
    end
  end

  def install
    bin.install Dir["ak*"].first => "ak"
  end

  test do
    assert_match "ak #{version}", shell_output("#{bin}/ak --version")
  end
end
