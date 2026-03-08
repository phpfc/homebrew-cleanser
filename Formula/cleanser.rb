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
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.4.3.tar.gz"
    rebuild 10
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "46e3c95dd49ca03a41832299bda5114547b26cc6ff73a4a8fb17696d17028b66"
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
