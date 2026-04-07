class Nomer < Formula
  desc "Maps Identifiers and Names to Other Identifiers and Names"
  homepage "https://github.com/globalbioticinteractions/nomer"
  url "https://github.com/globalbioticinteractions/nomer/releases/download/0.6.3/nomer.tar.gz"
  sha256 "b41dd9a30daea451faa8fa8936fa82f15e19c6983a8b685abc4b0d37ac3494f4"
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
