# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "d26341f7f5a833c2ea68ee7614e7a2c1e6bdd50a05de7155e12fd6c77b1d389b"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.4.2.tar.gz"
    rebuild 9
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8ed4310bfa0a4521294abe021e00863673e84e4fbb4b9bce6b8b26463565670b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.4.2", shell_output("#{bin}/cleanser --version")
  end
end
