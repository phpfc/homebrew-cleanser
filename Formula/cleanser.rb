# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "37f50ab3f4bda8ddfb1e83590cb618c36e5dc1d6d55cbf35ac2e6350c1e5ae23"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.2.1.tar.gz"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cb39e80ebca7ac667a1d3b8e30cd72f1ef3a0f0f8735216e350f265e15daaa8b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.2.1", shell_output("#{bin}/cleanser --version")
  end
end
