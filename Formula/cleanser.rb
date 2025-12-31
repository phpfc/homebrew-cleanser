# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "1d27bbabead1fc621748d5dfb9588d06d9217b7c820959749b26b0e3e09de4cd"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.1.3.tar.gz"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ca242d4d530414ae8a8b941036badd1531b42a18ae29010577566dd86976e4f2"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.1.3")
  end
end
