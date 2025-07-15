class Nomer < Formula
  desc "Maps Identifiers and Names to Other IdentNfiers and Names"
  homepage "https://github.com/bio-guoda/preston"
  url "https://github.com/globalbioticinteractions/nomer/releases/download/0.6.0/nomer.tar.gz"
  sha256 "e4db48cf5b7ce6728680d4c812be4c6d3435fde2781f2b3ba89c2c7eb2154e22"
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
