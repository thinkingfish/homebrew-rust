require 'formula'
require 'date'

class CargoNightly < Formula
  homepage 'http://crates.io'
  url 'https://static.rust-lang.org/cargo-dist/cargo-nightly-x86_64-apple-darwin.tar.gz'
  head 'https://github.com/rust-lang/cargo.git'
  version Date.today.to_s

  depends_on 'rust-nightly'
  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build

  def install
    system "./install.sh", "--prefix=#{prefix}"
  end

  test do
    system "#{bin}/cargo"
  end
end
