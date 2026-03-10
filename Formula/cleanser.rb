# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.7.2.tar.gz"
  sha256 "096d6ae62594f9a4a766eba0705719ba11006b9f34a33404923fda6b4cce6654"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.7.2.tar.gz"
    rebuild 21
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7ef7ddd90b68d6c2f0f2c9ecb5b0ef9504e42b2594ca6f2aa20d1a805873fda4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cleanser-cli")
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.7.2", shell_output("#{bin}/cleanser --version")
  end
end
