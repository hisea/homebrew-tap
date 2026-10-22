# Homebrew formula template for radian. Filled in by scripts/release-macos.sh;
# never edited by hand. The ALL-CAPS placeholders below are filled by that script.
class Radian < Formula
  desc "Coding agent in one Rust binary (full-screen TUI plus headless exec)"
  homepage "https://github.com/hisea/radian"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.2.0/radian-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "65040408d01ad92e43cb79404146fb6803272e1b003d1769673e28f7749f001a"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.2.0/radian-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "241c3e8d76858fddda82a0083ac197bb91f4046514fc036b069a228225f640b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.2.0/radian-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7153c4d9a4d47e095e45badad226611b51fa6fbf849e3d76fa7ebf3e17f67e60"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.2.0/radian-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c08a6aead2620b7b51e193cb61e295da69f767b99bd59d27b98261e6927bf7d4"
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
