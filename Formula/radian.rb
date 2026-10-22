# Homebrew formula template for radian. Filled in by scripts/release-macos.sh;
# never edited by hand. The ALL-CAPS placeholders below are filled by that script.
class Radian < Formula
  desc "Coding agent in one Rust binary (full-screen TUI plus headless exec)"
  homepage "https://github.com/hisea/radian"
  version "0.1.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.1.3/radian-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "2315d420869a847335f694459262f9188ec03adb76d9fd1c0f667dc3b0221f90"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.1.3/radian-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "eebc8106a93627fbe712e99df2e9247214f08a376c9e8d0f0d70217869b5eb97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.1.3/radian-0.1.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a282a878cba34b3c4e680045a8c082839bf71a9f65fe6afc92c33bd9f99fab6f"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.1.3/radian-0.1.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "428e462741300ebae91dcc407a98e2897d0e7487fa39dbc2af9857841815a621"
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
