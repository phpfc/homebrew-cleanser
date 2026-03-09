# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "30ef9258fc8e104e32b2ea6d87d314977cdbff9f12ba59886855507bdef775db"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.5.0.tar.gz"
    rebuild 15
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fd5a6b0b90471adb36faf29f09ed217b839d8f8fc626f9b8b75b2746c14c5c15"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.5.0", shell_output("#{bin}/cleanser --version")
  end
end
