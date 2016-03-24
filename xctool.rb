class Xctool < Formula
  desc "Drop-in replacement for xcodebuild with a few extra features"
  homepage "https://github.com/PSPDFKit-labs/xctool"
  url "https://github.com/PSPDFKit-labs/xctool/archive/0.2.8.pspdfkit1.tar.gz"
  sha256 "8ab2cb66c95824cea1b3e02fcc8b89181ca10aa5ff667acb0a5fd175815e7fd1"
  version "0.2.8.pspdfkit1"
  head "https://github.com/PSPDFKit-labs/xctool.git"

  depends_on :xcode => "6.0"

  def install
    system "./scripts/build.sh", "XT_INSTALL_ROOT=#{libexec}", "-IDECustomDerivedDataLocation=#{buildpath}"
    bin.install_symlink "#{libexec}/bin/xctool"
  end

  test do
    system "(#{bin}/xctool -help; true)"
  end
end
