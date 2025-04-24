class SshProxy < Formula
  desc "SSH Proxy Daemon"
  homepage "https://github.com/p1x3l101-10/ssh-proxy"
  version "1.6.3"
  url "https://github.com/p1x3l101-10/ssh-proxy.git",
    tag: "v#{version}"
  head "https://github.com/p1x3l101-10/ssh-proxy.git",
    branch: "main"
  license "BSD 3 Clause"

  depends_on "cmake" => :build
  depends_on "tomlplusplus" => :build
  depends_on "pkgconf" => :build
  depends_on "boost"

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
