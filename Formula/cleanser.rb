# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "d848c50e9722a50e20451c9e5660d2ae9a2f259830b04acf93f8f9ef0b978ad6"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/releases/download/v0.7.1"
    rebuild 21
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7ef7ddd90b68d6c2f0f2c9ecb5b0ef9504e42b2594ca6f2aa20d1a805873fda4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cleanser-cli")
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.7.1", shell_output("#{bin}/cleanser --version")
  end
end
