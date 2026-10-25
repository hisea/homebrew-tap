# Homebrew formula template for radian. Filled in by scripts/release-macos.sh;
# never edited by hand. The ALL-CAPS placeholders below are filled by that script.
class Radian < Formula
  desc "Coding agent in one Rust binary (full-screen TUI plus headless exec)"
  homepage "https://github.com/hisea/radian"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.4.0/radian-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "5f3644a7acbde34adb175088bc4194a72c9a380feb84d8746c6286fe66747438"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.4.0/radian-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "6aee27ba55db585187577ed45601fb7086dcc02599151568321091e20c1e41a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.4.0/radian-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d246eb8720ec552df307b1562459d3bdff29bdf48f0c9029ef3d44b03f30d6f1"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.4.0/radian-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "596679e5d7555baa62252484bb2c0ddc6b5cf5e85d68a41eaf5bacbf21f68f01"
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
