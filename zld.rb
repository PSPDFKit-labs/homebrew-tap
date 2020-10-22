class Zld < Formula
  version "1.2.1"
  desc "A faster version of ld, Apple's linker"
  url "https://github.com/PSPDFKit-labs/zld/releases/download/#{version}/zld.tar.gz"
  sha256 "b9fdd69cc274349625de1fb8df3820d005529cdf8377c47652846b4711b66e4f"
  homepage "https://github.com/michaeleisel/zld"

  def install
    bin.install "zld"
  end
end
