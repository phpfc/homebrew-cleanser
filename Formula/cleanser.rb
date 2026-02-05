# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "2df073ca2b9e215611f15c0f3905ae30238a49946580733948a3f2fe545c1f24"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/releases/download/v0.2.2"
    rebuild 6
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "39f859ccd689df89f49672b5ec2bea298060debf84e2076367c57799c2912a62"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.2.2", shell_output("#{bin}/cleanser --version")
  end
end
