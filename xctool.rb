class Xctool < Formula
  desc "Drop-in replacement for xcodebuild with a few extra features"
  homepage "https://github.com/PSPDFKit-labs/xctool"
  url "https://github.com/PSPDFKit-labs/xctool/archive/0.2.7.pspdfkit2.tar.gz"
  sha256 "c4fc1cf3e978a4fc9be1e001a45e93fd953b126b3bbc6dae9afc8fb4cde0f985"
  version "0.2.7.pspdfkit2"
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
