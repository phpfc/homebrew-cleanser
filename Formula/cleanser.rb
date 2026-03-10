# Homebrew Formula for Cleanser
# To use this formula:
# 1. Create a GitHub release with a tarball of the source
# 2. Update the url and sha256 below
# 3. Either submit to homebrew-core or create your own tap

class Cleanser < Formula
  desc "Fast CLI tool for clearing macOS storage space"
  homepage "https://github.com/phpfc/cleanser"
  url "https://github.com/phpfc/cleanser/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "daea7b5ddf2f4cd0fe347ae9f6331120407efc91bd34ab4f1113a1eebc173f0f"
  license "MIT"
  head "https://github.com/phpfc/cleanser.git", branch: "main"

  bottle do
    root_url "https://github.com/phpfc/cleanser/releases/download/v0.5.2"
    rebuild 17
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "127ac2f710b6d60a983dc7ec7f2c4def58ad48a1341b509f87d5531afb7bb9b2"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cleanser-cli")
  end

  test do
    system "#{bin}/cleanser", "--version"
    assert_match "cleanser 0.5.2", shell_output("#{bin}/cleanser --version")
  end
end
