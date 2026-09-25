class Anylut < Formula
  desc "Non-destructive photo edits for local agents"
  homepage "https://github.com/hisea/anylut-cli"
  url "https://github.com/hisea/anylut-cli/releases/download/v0.2.0/anylut-0.2.0-macos-arm64.tar.gz"
  version "0.2.0"
  sha256 "03eca3d482021207ae222696336bfb98f17917010b2eed920b0c208257340cf6"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "bin/anylut"
    share.install "share/anylut"
  end

  test do
    assert_match "anylut 0.2.0", shell_output("#{bin}/anylut --version")
    assert_match "Portra", shell_output("#{bin}/anylut capabilities --json")
    assert_match "Use the anylut command-line tool", shell_output("#{bin}/anylut guide")
    assert_predicate share/"anylut/AGENTS.md", :exist?
  end
end
