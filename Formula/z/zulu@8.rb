# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ZuluAT8 < Formula
  desc "java 8 for aarch64"
  homepage "https://www.azul.com/"
  version "8.80.0.17-ca-jdk8.0.422"
  url "https://cdn.azul.com/zulu/bin/zulu#{version}-macosx_aarch64.zip"
  sha256 "7f638b181e93402bcb0cf13def0b57353fae03fa32664868159921ea7b269116"
  license "GPLv2"

  depends_on arch: :arm64


  def install
    system "sh", "-c", "mv zulu-8.jdk/Contents/Home/* #{prefix}"
  end
end
