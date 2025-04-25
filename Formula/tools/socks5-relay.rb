class Socks5Relay < Formula
  desc "SOCKS5 Relay Proxy Daemon"
  homepage "https://github.com/p1x3l101-10/ssh-proxy"
  version "2.0.4"
  head "https://github.com/p1x3l101-10/ssh-proxy.git",
    branch: "main"
  url "https://github.com/p1x3l101-10/ssh-proxy.git",
    tag: "v#{version}"
  license "BSD 3 Clause"

  depends_on "cmake" => :build
  depends_on "tomlplusplus" => :build
  depends_on "pkgconf" => :build
  depends_on "magic_enum" => :build
  depends_on "boost"
  depends_on "log4cpp"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, "-DBUILD_WITH_SSH=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  service do
    run [bin/"socks5Relay", "--daemon", "--logfile", var/"log/socks5Relay.log"]
    keep_alive true
  end

  test do
    raise "Test not implemented."
  end
end
