class ClangFormat39 < Formula
  desc "Formatting tools for C, C++, Obj-C, Java, JavaScript, TypeScript. Local modifications for Objective-C code."
  homepage "http://clang.llvm.org/docs/ClangFormat.html"
  version "2016-12-09"

  stable do
    url "https://github.com/pspdfkit-labs/llvm.git", :branch => "pspdfkit/format-stable"

    resource "clang" do
      url "https://github.com/pspdfkit-labs/clang.git", :branch => "pspdfkit/format-stable"
    end

    resource "libcxx" do
      url "http://llvm.org/releases/3.9.0/libcxx-3.9.0.src.tar.xz"
      sha256 "d0b38d51365c6322f5666a2a8105785f2e114430858de4c25a86b49f227f5b06"
    end
  end

  depends_on "cmake" => :build
  depends_on "ninja" => :build  

  def install
    (buildpath/"projects/libcxx").install resource("libcxx")
    (buildpath/"tools/clang").install resource("clang")

    mkdir "build" do
      args = std_cmake_args
      args << "-DCMAKE_OSX_SYSROOT=/" unless MacOS::Xcode.installed?
      args << "-DLLVM_ENABLE_LIBCXX=ON"
      args << ".."
      system "cmake", "-G", "Ninja", *args
      system "ninja", "clang-format"
      bin.install "bin/clang-format"
    end
    bin.install "tools/clang/tools/clang-format/git-clang-format"
    (share/"clang").install Dir["tools/clang/tools/clang-format/clang-format*"]
  end

  test do
    # NB: below C code is messily formatted on purpose.
    (testpath/"test.c").write <<-EOS
      int         main(char *args) { \n   \t printf("hello"); }
    EOS

    assert_equal "int main(char *args) { printf(\"hello\"); }\n",
        shell_output("#{bin}/clang-format -style=Google test.c")
  end
end
