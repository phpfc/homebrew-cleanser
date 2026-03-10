# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "d848c50e9722a50e20451c9e5660d2ae9a2f259830b04acf93f8f9ef0b978ad6"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.7.1.tar.gz"
    rebuild 20
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e7161d8484e5832a290663142f54650e0a9d65bc44b0f236afdf1131f2200458"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cleanser-cli")
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.7.1", shell_output("#{bin}/cleanser --version")
  end
end
