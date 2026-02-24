class Ak < Formula
  desc "CLI/TUI tool for Artifact Keeper — an enterprise artifact registry"
  homepage "https://artifactkeeper.com"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.0.0/ak-darwin-arm64"
      sha256 "b5b9274e1f3bd675cd5cba2008d38c1fbfa15d6ce37c98f743eee89aeddd2fd3"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.0.0/ak-darwin-amd64"
      sha256 "3b9a2ad854d63bcc49cebfe3ed44515b243109108e1c280d79184c43990c0452"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.0.0/ak-linux-arm64"
      sha256 "782ac7c4bad8f97e6f6336c984699da951851085f1166a72e925aa3560993623"
    else
      url "https://github.com/artifact-keeper/artifact-keeper-cli/releases/download/v1.0.0/ak-linux-amd64"
      sha256 "982c4e5793a201a528d80a7cd72e8f185c3e0a3f596f06ba21a4a96e35bf59ec"
    end
  end

  def install
    bin.install Dir["ak*"].first => "ak"
  end

  test do
    assert_match "ak #{version}", shell_output("#{bin}/ak --version")
  end
end
