class BrewTools < Formula
  desc "Homebrew extensions"
  homepage "https://github.com/p1x3l101-10/brew-tools"
  version "2.0"
  url "https://github.com/p1x3l101-10/brew-tools.git",
    tag: "v#{version}",
    revision: "9d8311f295e403292edd1e15988b987ee59f3ca3"
  
  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
