# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "b65b13e62466638b8323345746f8cb8441e58615462354ad9247b0a75b9c5ad5"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.4.1.tar.gz"
    rebuild 8
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "159f3d7b57a893cb9c162ae594812dad4adb8051f58b8ef1aabae496bf1c27f7"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.4.1", shell_output("#{bin}/cleanser --version")
  end
end
