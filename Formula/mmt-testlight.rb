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
  version "1.47.1"

  # ── Platform binaries ──────────────────────────────────────────────
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mshobeyri/multimeter/releases/download/v#{version}/testlight-macos-arm64.tar.gz"
      sha256 "5e0747289808c98f27a430cbdf4b4361c3600d89f2e019c785952c44e0ff3cb1"
    else
      url "https://github.com/mshobeyri/multimeter/releases/download/v#{version}/testlight-macos-x64.tar.gz"
      sha256 "32c172798571160a9f807126b314523da367ce4da645fd0cde760ff2b706f884"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mshobeyri/multimeter/releases/download/v#{version}/testlight-linux-arm64.tar.gz"
      sha256 "6a981dfab28b325f736371027c97c38ab76c80d8d3a5c6adb8d809181d6639b6"
    else
      url "https://github.com/mshobeyri/multimeter/releases/download/v#{version}/testlight-linux-x64.tar.gz"
      sha256 "e2703cbdfaf0cab9b895f91dbb3a6b58421259741ebb4615d6848fd716ad35b4"
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