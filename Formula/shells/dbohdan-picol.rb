class DbohdanPicol < Formula
  desc "Tiny Tcl interpreter"
  homepage "https://chiselapp.com/user/dbohdan/repository/picol/"
  license "BSD2"
  version "0.6.1"
  url "https://github.com/dbohdan/picol/archive/refs/tags/version-#{version}.tar.gz"
  sha256 "8b5cc3db542a132a448a3109c82837e20b4766f025c42f8515d319e34285d9b8"

  def install
    system "make", "all"
    system "mkdir", "-p", "#{prefix}/include"
    bin.install "picolsh"
    bin.install "picolsh-big-stack"
    bin.install "picolsh-linenoise"
    system "install", "-m444", "picol.h", "#{prefix}/include/picol.h"
  end
end
