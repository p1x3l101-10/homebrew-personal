class SshProxyAT1 < Formula
  desc "SSH Proxy Daemon"
  homepage "https://github.com/p1x3l101-10/ssh-proxy"
  version "1.6.6"
  url "https://github.com/p1x3l101-10/ssh-proxy.git",
    tag: "v#{version}"
  license "BSD 3 Clause"
  revision 1

  depends_on "cmake" => :build
  depends_on "tomlplusplus" => :build
  depends_on "pkgconf" => :build
  depends_on "boost"

  deprecate! date: "2025-04-24", because: :deprecated_upstream, replacement: "ssh-proxy@2"
  disable! date: "2025-06-01", because: :deprecated_upstream, replacement: "ssh-proxy@2"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, "-DCMAKE_INSTALL_SYSCONFDIR=#{etc}"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  service do
    run bin/"ssh-proxy"
    keep_alive true
    log_path var/"log/ssh-proxy.log"
    error_log_path var/"log/ssh-proxy.log"
  end

  test do
    raise "Test not implemented."
  end
end
