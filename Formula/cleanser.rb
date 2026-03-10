# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "cd22a430636659a36409cb6210195ade70920e6f2fe3c2baf067c4cd2f9e3c82"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/releases/download/v0.7.0"
    rebuild 20
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e7161d8484e5832a290663142f54650e0a9d65bc44b0f236afdf1131f2200458"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cleanser-cli")
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.7.0", shell_output("#{bin}/cleanser --version")
  end
end
