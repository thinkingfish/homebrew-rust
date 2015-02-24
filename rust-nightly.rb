require 'formula'
require 'date'

class RustNightly < Formula
  homepage 'http://www.rust-lang.org/'
  url 'https://static.rust-lang.org/dist/rustc-nightly-src.tar.gz'
  head 'https://github.com/rust-lang/rust.git'
  version Date.today.to_s

  conflicts_with 'rust', :because => 'multiple version'

  def install
    args = ["--prefix=#{prefix}"]
    args << "--disable-rpath" if build.head?
    args << "--enable-clang" if ENV.compiler == :clang
    system "./configure", *args
    system "make"
    system "make install"
  end

  test do
    system "#{bin}/rustc"
    system "#{bin}/rustdoc", "-h"
  end
end
