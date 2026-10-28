# Homebrew formula template for radian. Filled in by scripts/release-macos.sh;
# never edited by hand. The ALL-CAPS placeholders below are filled by that script.
class Radian < Formula
  desc "Coding agent in one Rust binary (full-screen TUI plus headless exec)"
  homepage "https://github.com/hisea/radian"
  version "0.5.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.5.1/radian-0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "1ce104d1a2e6e08de9a2cc0203225dc6beff0d1b87b9f69d89c75a2cf0587513"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.5.1/radian-0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "a181c15067dcdf1354b4cb1d475dafa7b5d5ef80c9b6594fcf55afb94e4299db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.5.1/radian-0.5.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "621b05248051a480e5e07f7d4f2f4af5bc2246f5ede3b4fcc9cf1ed2bea23608"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.5.1/radian-0.5.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "37b4039e53840a0c264c4b5676d5f873f52cbcfead00d52148f60fc42a81df08"
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
