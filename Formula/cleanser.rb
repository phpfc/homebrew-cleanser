# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "dfad857d6a33053e62297b87b30cacd5be4e1a10182c88f5595c41f4f1f66e0b"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.3.0.tar.gz"
    rebuild 6
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "39f859ccd689df89f49672b5ec2bea298060debf84e2076367c57799c2912a62"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.3.0", shell_output("#{bin}/cleanser --version")
  end
end
