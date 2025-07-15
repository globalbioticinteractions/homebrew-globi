class Elton < Formula
  desc "Access, Review and Index Existing Species Interaction Datasets "
  homepage "https://github.com/bio-guoda/preston"
  url "https://github.com/globalbioticinteractions/elton/releases/download/0.16.0/elton.tar.gz"
  sha256 "21b084bf9f67f75d37a22298583fc8d72023bbee5584b2652d60ab59b8bbe47a"
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
