class Ak < Formula
  desc "CLI/TUI tool for Artifact Keeper — an enterprise artifact registry"
  homepage "https://artifactkeeper.com"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.3/ak-darwin-arm64"
      sha256 "e5fdd4f73e3f1842fd9b0f50678fecbd940264973b0ec4e05fb5d49276488a26"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.3/ak-darwin-amd64"
      sha256 "0f10918ed66887a2a4f06b0bef9fbe5364f89b3bbabe3117668099c59c7ab803"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.3/ak-linux-arm64"
      sha256 "ba3f9f4dbe83e0ba20414836ce153205a04218c9b40f1940e9c241c09c9973f3"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v0.4.3/ak-linux-amd64"
      sha256 "8e9bfb098c72a6bb9c7623f39715c8aa86d684626d0c69f6d4ff6305b9f02964"
    end
  end

  def install
    bin.install Dir["ak*"].first => "ak"
  end

  test do
    assert_match "ak #{version}", shell_output("#{bin}/ak --version")
  end
end
