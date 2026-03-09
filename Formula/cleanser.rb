# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "95d2218e90940f4f0484a399a39051344d9d2f59397f877547b60c9923a11102"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/releases/download/v0.4.4"
    rebuild 12
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "eba80ae211168f383afa4bb6ffc3753866f28d43d6bb5b819e66372ed640701f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.4.4", shell_output("#{bin}/cleanser --version")
  end
end
