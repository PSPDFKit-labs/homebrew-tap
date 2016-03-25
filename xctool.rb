class Xctool < Formula
  desc "Drop-in replacement for xcodebuild with a few extra features"
  homepage "https://github.com/PSPDFKit-labs/xctool"
  url "https://github.com/PSPDFKit-labs/xctool/archive/0.2.8.pspdfkit2.tar.gz"
  sha256 "59ef21a9a76f0d3c7d1c908331d6115fe192f0728d8e8627239272bdf0835040"
  version "0.2.8.pspdfkit2"
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
