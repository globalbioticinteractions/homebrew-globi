class Nomer < Formula
  desc "Maps Identifiers and Names to Other Identifiers and Names"
  homepage "https://github.com/globalbioticinteractions/nomer"
  url "https://github.com/globalbioticinteractions/nomer/releases/download/0.6.6/nomer.tar.gz"
  sha256 "4635399d0ca33a73f255d3295181c0eb904951a4ad9f3eb9bdbe4ad6710e5968"
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
