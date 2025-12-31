# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "a702abcad70405475d742fa8e5af81469b4a6b74583b5cac7376245945c5a457"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/releases/download/v0.1.3"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a6e1b7a9fdd512efe29a1d250da83fe5105bf5dc5c169bfc24dfff86ac23ee32"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.1.3", shell_output("#{bin}/cleanser --version")
  end
end
