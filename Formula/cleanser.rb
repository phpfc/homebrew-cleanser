# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "dfad857d6a33053e62297b87b30cacd5be4e1a10182c88f5595c41f4f1f66e0b"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/releases/download/v0.3.0"
    rebuild 7
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9e3eb1d0ab7e3919a97774d4a7ee4e35fbd960fcdf65987af2203281f2f321b8"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.3.0", shell_output("#{bin}/cleanser --version")
  end
end
