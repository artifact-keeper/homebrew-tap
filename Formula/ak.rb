class Ak < Formula
  desc "CLI/TUI tool for Artifact Keeper — an enterprise artifact registry"
  homepage "https://artifactkeeper.com"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.1.0/ak-darwin-arm64"
      sha256 "70cb80ab2fbaabd8dcdbf170397cbd4e94bc941009078776579c0cda379de0f6"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.1.0/ak-darwin-amd64"
      sha256 "4b3a15ee59c9e7a97806450e6a9e38bf60e5b3f11918b77d7675c9c109c2412b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.1.0/ak-linux-arm64"
      sha256 "6be76d15acad7814841ed2a2e45ae470f96f430db36635c012a2ba1ba4709353"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.1.0/ak-linux-amd64"
      sha256 "83788542b5393291e740c6008af7d991428e8979b00d688f30523fb374e222bc"
    end
  end

  def install
    bin.install Dir["ak*"].first => "ak"
  end

  test do
    assert_match "ak #{version}", shell_output("#{bin}/ak --version")
  end
end
