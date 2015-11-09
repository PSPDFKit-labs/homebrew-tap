class Xctool < Formula
  desc "Drop-in replacement for xcodebuild with a few extra features"
  homepage "https://github.com/PSPDFKit-labs/xctool"
  url "https://github.com/PSPDFKit-labs/xctool/archive/0.2.7.pspdfkit1.tar.gz"
  sha256 "7943fb9d8b83a47bc5c11f5641034b7113b21917facdbcc3a9ff22458eac3296"
  version "0.2.7.pspdfkit1"
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
