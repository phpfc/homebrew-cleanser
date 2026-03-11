# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "963f1e23a11e8144afc241e4898056f1c2669917b44b59a5cf3a3cbc1b7db873"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/releases/download/v0.8.0"
    rebuild 23
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5f27df7a4f5c2f76677ed61fb7efd939a64febc4ae65b9a210a799c12f800a82"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cleanser-cli")
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.8.0", shell_output("#{bin}/cleanser --version")
  end
end
