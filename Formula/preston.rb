class Preston < Formula
  desc "Biodiversity Dataset Tracker"
  homepage "https://github.com/bio-guoda/preston"
  url "https://github.com/bio-guoda/preston/releases/download/0.11.3/preston.tar.gz"
  sha256 "db2cc5ee73cef0937d1fc238e950a7d536f7ba9e960704e5f54fa56dfa6b532c"
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
