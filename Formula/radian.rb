# Homebrew formula template for radian. Filled in by scripts/release-macos.sh;
# never edited by hand. The ALL-CAPS placeholders below are filled by that script.
class Radian < Formula
  desc "Coding agent in one Rust binary (full-screen TUI plus headless exec)"
  homepage "https://github.com/hisea/radian"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.3.0/radian-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "924dd3c65e30618a75001a8e827d3f62e509523aeaa1d8c435be043d8c60c026"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.3.0/radian-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "941a88c32dd1ddc6546739e28ea5dcd5e63da528bee59d4db15da6563db2fe52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.3.0/radian-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3d69ec1ef2c104b837833c885b9022e510a1cef0b7a429e301b924b6c6228816"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.3.0/radian-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5e91bd276646f2bf6a44829882518d076b3fb113a912aa25fb4707b2d7b0022d"
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
