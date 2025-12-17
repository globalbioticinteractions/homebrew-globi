class Preston < Formula
  desc "Biodiversity Dataset Tracker"
  homepage "https://github.com/bio-guoda/preston"
  url "https://github.com/bio-guoda/preston/releases/download/0.11.4/preston.tar.gz"
  sha256 "7200d4f8f778afdb5f469f5fa3bd83e2b43a3368cef401a0126e8bd020839789"
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
