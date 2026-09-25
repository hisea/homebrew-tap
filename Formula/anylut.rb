class Anylut < Formula
  desc "Non-destructive photo edits for local agents"
  homepage "https://github.com/hisea/anylut-cli"
  url "https://github.com/hisea/anylut-cli/releases/download/v0.1.0/anylut-0.1.0-macos-arm64.tar.gz"
  version "0.1.0"
  sha256 "dbe77eefb679b62cdb94a805112a627973941090563a8596969693816ff21255"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "bin/anylut"
    share.install "share/anylut"
  end

  test do
    assert_match "anylut 0.1.0", shell_output("#{bin}/anylut --version")
    assert_match "Portra", shell_output("#{bin}/anylut capabilities --json")
  end
end
