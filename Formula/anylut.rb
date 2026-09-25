class Anylut < Formula
  desc "Non-destructive photo edits for local agents"
  homepage "https://github.com/hisea/anylut-cli"
  url "https://github.com/hisea/anylut-cli/releases/download/v0.3.0/anylut-0.3.0-macos-arm64.tar.gz"
  version "0.3.0"
  sha256 "2c9061fc79765751ca5873cdd9993dc9beb145879f35079b47207d9d1ffee89d"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "bin/anylut"
    share.install "share/anylut"
  end

  test do
    assert_match "anylut 0.3.0", shell_output("#{bin}/anylut --version")
    assert_match "Portra", shell_output("#{bin}/anylut capabilities --json")
    assert_match "Use the anylut command-line tool", shell_output("#{bin}/anylut guide")
    assert_predicate share/"anylut/AGENTS.md", :exist?
  end
end
