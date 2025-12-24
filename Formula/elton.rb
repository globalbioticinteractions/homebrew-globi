class Elton < Formula
  desc "Access, Review and Index Existing Species Interaction Datasets "
  homepage "https://github.com/globalbioticinteractions/elton"
  url "https://github.com/globalbioticinteractions/elton/releases/download/0.16.3/elton.tar.gz"
  sha256 "a14801f5eb1a8a32dd0e099b0a62d0dd1f22aed9c21dca97eb1820a4b538728e"
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
