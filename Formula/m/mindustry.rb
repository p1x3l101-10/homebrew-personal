# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Mindustry < Formula
  desc " The automation tower defense RTS "
  homepage "https://mindustrygame.github.io/"
  version "146"
  url "https://github.com/Anuken/Mindustry/releases/download/v#{version}/Mindustry.jar"
  sha256 "3ab0e46c3cbdc863529ba05e804847ef00e3dbdb4567b5c27c5e6dce071b93f9"
  license "GPL3"

  depends_on "gradle" => :build
  depends_on "openjdk@17"

  def install
    libexec.install "Mindustry.jar"
    bin.write_jar_script "#{libexec}/Mindustry.jar", "mindustry", java_version: "17"
  end
end
