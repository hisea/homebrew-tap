# Homebrew formula template for radian. Filled in by scripts/release-macos.sh;
# never edited by hand. The ALL-CAPS placeholders below are filled by that script.
class Radian < Formula
  desc "Coding agent in one Rust binary (full-screen TUI plus headless exec)"
  homepage "https://github.com/hisea/radian"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.1.0/radian-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "4e5cc5e22843d59e2d0d8d1aaf24917bb3d090621c59e3adf14811f0e260150c"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.1.0/radian-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "8b8b81d3ec2a6de26d5654179782df07a966c3f68af05588b8a6c08a9d06f7ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hisea/radian/releases/download/v0.1.0/radian-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e5bd76de2dede9f31d4f8bc7fe8dab6df477338efa44be1c96a4809b4fa63f57"
    end
    on_intel do
      url "https://github.com/hisea/radian/releases/download/v0.1.0/radian-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "24b1b5442d86eeb076a797077dd1d8ad4e6ad478135a8d82baf4e395097fb6fe"
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
