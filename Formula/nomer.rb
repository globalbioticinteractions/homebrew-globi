class Nomer < Formula
  desc "Maps Identifiers and Names to Other Identifiers and Names"
  homepage "https://github.com/globalbioticinteractions/nomer"
  url "https://github.com/globalbioticinteractions/nomer/releases/download/0.6.1/nomer.tar.gz"
  sha256 "b2ae7c317d4f89788a7c623dd73671522fc908439ba3ccbb4b4779ce3f51224a"
  license "GPLv3"

  depends_on "openjdk@21"

  def install
    libexec.install "lib/nomer.jar"
    bin.write_jar_script libexec/"nomer.jar", "nomer"
  end

  test do
    output = pipe_output("#{bin}/nomer append --include-header gbif-parse", "\tHomo sapiens")
    assert_match "resolvedRank", output
    assert_match "SAME_AS", output
  end
end
