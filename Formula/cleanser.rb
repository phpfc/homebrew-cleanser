# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.7.3.tar.gz"
  sha256 "2b62a8023845a5c643b16056db99242874f0dfe8a81e8d7320ee29abb2569345"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/releases/download/v0.7.3"
    rebuild 24
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ee78bcd8f944f457b6d468aaa9991123debaa9643ce53db35012c110fefc0dc4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cleanser-cli")
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.7.3", shell_output("#{bin}/cleanser --version")
  end
end
