# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Picol < Formula
  desc "Tiny TCL implementation"
  homepage "http://oldblog.antirez.com/post/picol.html"
  url "http://antirez.com/picol/picol.c.txt"
  version "1"
  sha256 "daa62285f2f5f55d163daee2528ce8026a533221da6a305e89f7a85e034c3f31"
  license "GPLv2"

  def install
    system "cc", "-O2", "-Wall", "picol.c.txt", "-o", "picol"
    system "mkdir", "-p", "#{prefix}/bin"
    system "install", "-m0755", "#{prefix}/bin/picol"
  end
end
