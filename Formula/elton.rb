class Elton < Formula
  desc "Access, Review and Index Existing Species Interaction Datasets "
  homepage "https://github.com/globalbioticinteractions/elton"
  url "https://github.com/globalbioticinteractions/elton/releases/download/0.16.12/elton.tar.gz"
  sha256 "bcccb41e9a21929390df91b380d4c13c228d8538b1932691340a11a314a076c3"
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
