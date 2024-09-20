class BrewTools < Formula
  desc "Homebrew extensions"
  homepage "https://github.com/p1x3l101-10/brew-tools"
  version "2.1"
  url "https://github.com/p1x3l101-10/brew-tools.git",
    tag: "v#{version}",
    revision: "55128588f3f4fb30782e67ecdfbbad899de4e52e"
  
  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
