class Ak < Formula
  desc "CLI/TUI tool for Artifact Keeper — an enterprise artifact registry"
  homepage "https://artifactkeeper.com"
  version "1.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.11.0/ak-darwin-arm64"
      sha256 "912c03ebfb9b1ef31dc26f8b7fcefef1c23cca576de12dae85c3f490a7614561"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.11.0/ak-darwin-amd64"
      sha256 "2c96f520fc5dcbdc18f174a9b5bfeda6a5605739f32ccae8fc9e92e232b7ccfd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.11.0/ak-linux-arm64"
      sha256 "3d13e3ed6242e2b9f79898bb927c4dcd4ff70ddc7dd0473e371ffec8e6081977"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.11.0/ak-linux-amd64"
      sha256 "6898b47a8c21061caefa15949c93ad1abe7d6c8e1f231202770fe4ebb7173fb8"
    end
  end

  def install
    bin.install Dir["ak*"].first => "ak"
  end

  test do
    assert_match "ak #{version}", shell_output("#{bin}/ak --version")
  end
end
