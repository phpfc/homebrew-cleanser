# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.4.6.tar.gz"
  sha256 "220025cd5889e7310e12aceff8ac304c768701abcaa2540c86ca18df1fe0a37b"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.4.6.tar.gz"
    rebuild 14
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5a9196f1d42035cc0cde3edf7732d30ffe402cd38098d4ff4166c3d22c0784f0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.4.6", shell_output("#{bin}/cleanser --version")
  end
end
