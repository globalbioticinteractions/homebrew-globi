class Preston < Formula
  desc "Biodiversity Dataset Tracker"
  homepage "https://github.com/bio-guoda/preston"
  url "https://github.com/bio-guoda/preston/releases/download/0.11.5/preston.tar.gz"
  sha256 "0b13a5b97ec15ee51893682c54af2f10f9743358a414fbbf31d1eb1ae4c5d428"
  license "MIT"

  depends_on "openjdk@21"

  def install
    libexec.install "lib/preston.jar"
    bin.write_jar_script libexec/"preston.jar", "preston"
  end

  test do
    output = pipe_output("#{bin}/preston track", "testing123")
    assert_match "d3e54e9d6814999b722fcf9fce64511c16558825fff8d344cb177cafae6e87a3", output
  end
end
