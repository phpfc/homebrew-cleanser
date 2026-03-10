# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "46042758966d67553b974b87ccff4c7218d8735ead68a1c690d62a7e3afe2178"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.6.0.tar.gz"
    rebuild 18
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1d244a868af44873ec500cefaddb9cbfafc27a78e2c8dbeb9a1b9801df55a289"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cleanser-cli")
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.6.0", shell_output("#{bin}/cleanser --version")
  end
end
