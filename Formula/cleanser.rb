# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "ff782d3b2516a2288f8885eb1c691b8bdf54af87edd68e15e46243c64fa6351a"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/releases/download/v0.4.3"
    rebuild 11
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b84cf79ae57016f474e3062d0cde968e380b4795c1f2c94a1ab889b549adbd43"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.4.3", shell_output("#{bin}/cleanser --version")
  end
end
