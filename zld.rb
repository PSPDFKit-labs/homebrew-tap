class Zld < Formula
  version "1.2.1"
  desc "A faster version of ld, Apple's linker"
  url "https://github.com/michaeleisel/zld/archive/#{version}/zld.tar.gz"
  sha256 "fbc8f18687ab779688c2f83333748a6c777d9ba621e4c0c403abb8ee562b07c0"
  homepage "https://github.com/michaeleisel/zld"

  def install
    bin.install "zld"
  end
end
