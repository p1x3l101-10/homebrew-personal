class DbohdanPicol < Formula
  desc "Tiny Tcl interpreter"
  homepage "https://chiselapp.com/user/dbohdan/repository/picol/"
  license "BSD2"
  head "https://github.com/dbohdan/picol.git", using: :git

  def install
    system "make", "all"
    bin.install "picolsh"
    bin.install "picolsh-big-stack"
    bin.install "picolsh-line-edit"
  end
end
