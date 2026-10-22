# Homebrew formula template for radian. Filled in by scripts/release-macos.sh;
# never edited by hand. The ALL-CAPS placeholders below are filled by that script.
class Radian < Formula
  desc "Coding agent in one Rust binary (full-screen TUI plus headless exec)"
  homepage "https://github.com/hisea/radian"
  version "0.1.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.1.2/radian-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "f33d57fdfdc49c9623615c9e9eef175d198fdd42d013bf9d9e836d49bb9d86bf"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.1.2/radian-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "088b4a332a10bd0395c28d956f998d8be6bdc73fc61e49529cc9db1e1f1c46fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.1.2/radian-0.1.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "684c29ec04858f62829a8cbbcd824abdac25444029c18bbdd4edf16fa6c9820a"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.1.2/radian-0.1.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5dccb8dc97aa837a20f04af3a44dbd0c97b068eb533205f858d5c1ed2b6d5cdb"
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
