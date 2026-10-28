# Homebrew formula template for radian. Filled in by scripts/release-macos.sh;
# never edited by hand. The ALL-CAPS placeholders below are filled by that script.
class Radian < Formula
  desc "Coding agent in one Rust binary (full-screen TUI plus headless exec)"
  homepage "https://github.com/hisea/radian"
  version "0.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.5.0/radian-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "c2083430d5659defb6d3ae3a051dd671d7da052120ba8427c66ff94e20cebb85"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.5.0/radian-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "d21b3c26273fa5d9f4619696d01a1b06dbba0d6c0173a94fb1d1215faea71d06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.5.0/radian-0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "91346669f51877d6af9bb1a6cd479b83a5e159f25cee4dc09c4f00b8db77f1a5"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.5.0/radian-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2f0af3dfa0a3f74551e65a31a29ffcc8d02e86967897eddb7c107867dd9b8d07"
    end
  end

  def install
    # Only `radian`: homebrew-core already has a `rad` formula, so this one
    # must not link a `rad` binary.
    bin.install "radian"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/radian --version")
    # Print-and-exit modes need no model, key or network; --list proves the
    # binary runs past startup in the sandbox.
    system bin/"radian", "exec", "--list", "--session-dir", testpath/"sessions"
  end
end
