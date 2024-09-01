class ZuluAT8 < Formula
  desc "Java 8 for M1, provided by Zulu"
  homepage "https://www.azul.com/"
  version "8.80.0.17-ca-jdk8.0.422"
  url "https://cdn.azul.com/zulu/bin/zulu#{version}-macosx_aarch64.zip"
  sha256 "7f638b181e93402bcb0cf13def0b57353fae03fa32664868159921ea7b269116"
  license "GPLv2"

  depends_on arch: :arm64
  depends_on macos: :catalina

  keg_only :shadowed_by_macos


  def install
    #system "sh", "-c", "mv zulu-8.jdk/Contents/Home/* #{prefix}"
    libexec.install Dir["*.jdk"].first => "zulu-8.jdk"
    bin.install_symlink Dir["#{libexec}/zulu-8.jdk/Contents/Home/bin/*"]
    include.install_symlink Dir["#{libexec}/zulu-8.jdk/Contents/Home/include/*.h"]
    include.install_symlink Dir["#{libexec}/zulu-8.jdk/Contents/Home/include/#{OS.kernel_name.downcase}/*.h"]
    man1.install_symlink Dir["#{libexec}/zulu-8.jdk/Contents/Home/man/man1/*"]
  end
end
