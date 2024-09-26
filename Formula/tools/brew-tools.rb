class BrewTools < Formula
  desc "Homebrew extensions"
  homepage "https://github.com/p1x3l101-10/brew-tools"
  version "2.7.1"
  url "https://github.com/p1x3l101-10/brew-tools.git",
    tag: "v#{version}"
  head "https://github.com/p1x3l101-10/brew-tools.git",
    branch: "main"
  
  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
