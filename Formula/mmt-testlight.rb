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
  version "1.46.5"

  # ── Platform binaries ──────────────────────────────────────────────
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mshobeyri/multimeter/releases/download/v#{version}/testlight-macos-arm64.tar.gz"
      sha256 "dbc1c8aa1a1f3c748b27e5509c0b7a87889854603e37b19e1452492ed3c9ab8c"
    else
      url "https://github.com/mshobeyri/multimeter/releases/download/v#{version}/testlight-macos-x64.tar.gz"
      sha256 "b2edf25910cdc6ce601e82f35f1ca34a03f6f50ec580f8555ecf17f606738b6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mshobeyri/multimeter/releases/download/v#{version}/testlight-linux-arm64.tar.gz"
      sha256 "93f4ce26e338c112bb75ba03e598aa72aec07527e36e7400c516f574d99a1743"
    else
      url "https://github.com/mshobeyri/multimeter/releases/download/v#{version}/testlight-linux-x64.tar.gz"
      sha256 "49749e0a708d30b1e93fed2d15884dd39fe896cfbbe85756d5e9555feba34a4b"
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