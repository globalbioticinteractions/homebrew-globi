class Elton < Formula
  desc "Access, Review and Index Existing Species Interaction Datasets "
  homepage "https://github.com/globalbioticinteractions/elton"
  url "https://github.com/globalbioticinteractions/elton/releases/download/0.16.14/elton.tar.gz"
  sha256 "c4d9c574eb755325423998df1b0a18cf0a858135b43f4cb42dcf23c8875f3bba"
  license "GPLv3"

  depends_on "openjdk@21"

  def install
    libexec.install "lib/elton.jar"
    bin.write_jar_script libexec/"elton.jar", "elton"
  end

  test do
    output = shell_output("#{bin}/elton track globalbioticinteractions/template-dataset && #{bin}/elton interactions globalbioticinteractions/template-dataset")
    assert_match "sourceTaxonName", output
  end
end
