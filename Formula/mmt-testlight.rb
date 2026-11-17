# ──────────────────────────────────────────────────────────────────────
# Homebrew Formula for mmt-testlight
# ──────────────────────────────────────────────────────────────────────
# To use as a tap:
#   brew tap mshobeyri/multimeter
#   brew install mmt-testlight
#
# Or install directly:
#   brew install mshobeyri/multimeter/mmt-testlight
# ──────────────────────────────────────────────────────────────────────

class MmtTestlight < Formula
  desc "CLI runner for Multimeter .mmt API tests, suites, and documentation"
  homepage "https://github.com/mshobeyri/multimeter"
  license "Apache-2.0"
  version "1.50.2"

  # ── Platform binaries ──────────────────────────────────────────────
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mshobeyri/multimeter/releases/download/v#{version}/testlight-macos-arm64.tar.gz"
      sha256 "2a9a3ac974f32a7ebd21ef1f4f273e8b98238b60ae53135d0cc17b284fdf979e"
    else
      url "https://github.com/mshobeyri/multimeter/releases/download/v#{version}/testlight-macos-x64.tar.gz"
      sha256 "5acb0c16649fd57b74791cbeae943954c24c0e4f9d9dfe2c34d2e41817eee963"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mshobeyri/multimeter/releases/download/v#{version}/testlight-linux-arm64.tar.gz"
      sha256 "6672d257549a54407d2c93eee302256c7df9a96d8c8e7859caa2ee397ec9d2fa"
    else
      url "https://github.com/mshobeyri/multimeter/releases/download/v#{version}/testlight-linux-x64.tar.gz"
      sha256 "4d1409a01d9d30a101d2214edb356b8c18edf0db001d0e0e4d987adde8dcab25"
    end
  end

  def install
    bin.install "testlight"
    bin.install_symlink "testlight" => "mmt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/testlight --version")
    assert_match version.to_s, shell_output("#{bin}/mmt --version")
  end
end