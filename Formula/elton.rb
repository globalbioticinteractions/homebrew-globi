class Elton < Formula
  desc "Access, Review and Index Existing Species Interaction Datasets "
  homepage "https://github.com/globalbioticinteractions/elton"
  url "https://github.com/globalbioticinteractions/elton/releases/download/0.16.7/elton.tar.gz"
  sha256 "a823b03c327571e9d8c67636e59b7c07536b43ae4c208be58c5c90f15a0595f4"
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
