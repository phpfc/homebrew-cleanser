# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.7.5.tar.gz"
  sha256 "f5f60f54cd18a3226faa3edb94ea3b58e47e6c69372c07a6d78043b3e778cc4c"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.7.5.tar.gz"
    rebuild 25
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0d23d65c4c81300c85a63a2d4586bc71456be902e81817f966fd5ee392711caf"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cleanser-cli")
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.7.5", shell_output("#{bin}/cleanser --version")
  end
end
