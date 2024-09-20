class BrewTools < Formula
  desc "Homebrew extensions"
  homepage "https://github.com/p1x3l101-10/brew-tools"
  version "2.5"
  url "https://github.com/p1x3l101-10/brew-tools.git",
    tag: "v#{version}",
    revision: "cfbf34028184bc9b156b8e8413ddb60d65a129ab"
  head "https://github.com/p1x3l101-10/brew-tools.git",
    branch: "main"
  
  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
