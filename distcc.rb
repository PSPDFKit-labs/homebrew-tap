class Distcc < Formula
  desc "Distributed compiler client and server"
  homepage "https://github.com/PSPDFKit-labs/distcc/"
  url "https://github.com/PSPDFKit-labs/distcc/archive/v3.2rc1.pspdfkit.tar.gz"
  version "3.2rc1.pspdfkit"
  sha256 "523a8bd2fcbd2a6fa59d6dad5809676f93fcc05c8ebb8770f4ddb4390b41debe"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "python3" => :build

  def install
    # Make sure python stuff is put into the Cellar.
    # --root triggers a bug and installs into HOMEBREW_PREFIX/lib/python2.7/site-packages instead of the Cellar.
    inreplace "Makefile.in", '--root="$$DESTDIR"', ""
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--without-libiberty", "--disable-Werror"
    system "make", "install"
  end

  plist_options :manual => "distccd"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>ProgramArguments</key>
        <array>
            <string>#{opt_prefix}/bin/distccd</string>
            <string>--daemon</string>
            <string>--no-detach</string>
            <string>--allow=192.168.0.1/24</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{opt_prefix}</string>
      </dict>
    </plist>
    EOS
  end

  test do
    system "#{bin}/distcc", "--version"
  end
end
