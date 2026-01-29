class Elton < Formula
  desc "Access, Review and Index Existing Species Interaction Datasets "
  homepage "https://github.com/globalbioticinteractions/elton"
  url "https://github.com/globalbioticinteractions/elton/releases/download/0.16.4/elton.tar.gz"
  sha256 "8e84d482ceb5767886eb7df741c1264b91c70834ed7f741d77bad008fc76ddf8"
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
