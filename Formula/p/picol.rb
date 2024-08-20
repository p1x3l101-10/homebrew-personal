class Picol < Formula
  desc "Tiny TCL implementation"
  homepage "http://oldblog.antirez.com/post/picol.html"
  url "http://antirez.com/picol/picol.c.txt"
  version "1"
  sha256 "daa62285f2f5f55d163daee2528ce8026a533221da6a305e89f7a85e034c3f31"
  license "GPLv2"

  def install
    system "mv", "picol.c.txt", "picol.c"
    system "cc", "-O2", "-Wall", "picol.c", "-o", "picol"
    bin.install "picol"
  end
end
