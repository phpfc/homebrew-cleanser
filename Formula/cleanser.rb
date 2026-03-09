# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.4.5.tar.gz"
  sha256 "2199f8cbc2c3e99fd1abebce4b80bd4eac69972fc750713923a05144ff0f8bc0"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.4.5.tar.gz"
    rebuild 12
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "eba80ae211168f383afa4bb6ffc3753866f28d43d6bb5b819e66372ed640701f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.4.5", shell_output("#{bin}/cleanser --version")
  end
end
