class Xctool < Formula
  desc "Drop-in replacement for xcodebuild with a few extra features"
  homepage "https://github.com/PSPDFKit-labs/xctool"
  url "https://github.com/PSPDFKit-labs/xctool/archive/0.2.8.pspdfkit3.tar.gz"
  sha256 "a2221c3202cb20f350fb40b8006a65c701119a857d0b02b2d1ee42ab02ffd5a9"
  version "0.2.8.pspdfkit3"
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
