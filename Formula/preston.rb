class Preston < Formula
  desc "Biodiversity Dataset Tracker"
  homepage "https://github.com/bio-guoda/preston"
  url "https://github.com/bio-guoda/preston/releases/download/0.11.0/preston.tar.gz"
  sha256 "19d70853f3cc1146f7dccef34dad7525c37bd26e6e9a38d980718fddcc7c7100"
  license "MIT"

  depends_on "openjdk@21"

  def install
    libexec.install "lib/preston.jar"
    bash_completion.install "etc/bash_completion.d/preston_completion"
    bin.write_jar_script libexec/"preston.jar", "preston"
  end

  test do
    output = pipe_output("#{bin}/preston track", "testing123")
    assert_match "d3e54e9d6814999b722fcf9fce64511c16558825fff8d344cb177cafae6e87a3", output
  end
end
