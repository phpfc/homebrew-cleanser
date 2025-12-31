# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "bea6da45a8c69325beda3d856996cc0c8a67bab09f4e9530b8b15ce3cfac13de"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.1.3.tar.gz"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "df6244610cb214943a66d12793a3eb9e140eb591f3c837b7eb5651d780f7d9a0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.1.3", shell_output("#{bin}/cleanser --version")
  end
end
