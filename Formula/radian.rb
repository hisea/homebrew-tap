# Homebrew formula template for radian. Filled in by scripts/release-macos.sh;
# never edited by hand. The ALL-CAPS placeholders below are filled by that script.
class Radian < Formula
  desc "Coding agent in one Rust binary (full-screen TUI plus headless exec)"
  homepage "https://github.com/hisea/radian"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.1.1/radian-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "853cf123798270ac96abffbf9d4e92de00be5e254159e2a3afce251f16ceb150"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.1.1/radian-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "cce0b999dd31fe3ba8b9c9422e3009d992f108330a1899660f5fe289d0583fc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.1.1/radian-0.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c69d1a932e9e032233ef8ec1399bcdff76fae56e1a7c8c20564d354986890c33"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.1.1/radian-0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "80111fea1de6d6b1c429e521641ed96bb5427e6024d4f174f73da263efc7a02c"
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
