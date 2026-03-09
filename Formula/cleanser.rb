# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "5501931182b8b830c21b137008ed2ab89f3e90757ecbebe509a7bfd6b2a3f320"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/releases/download/v0.5.1"
    rebuild 16
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2b2b28f87067c43fdf0fdbf1e44cdceae559ce140e5b312c06082f99967041da"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cleanser-cli")
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.5.1", shell_output("#{bin}/cleanser --version")
  end
end
