class SshProxy < Formula
  desc "SSH Proxy Daemon"
  homepage "https://github.com/p1x3l101-10/ssh-proxy"
  version "1.5"
  url "https://github.com/p1x3l101-10/ssh-proxy.git",
    tag: "v#{version}"
  head "https://github.com/p1x3l101-10/ssh-proxy.git",
    branch: "main"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, "-DHOMEBREW_ALLOW_FETCHCONTENT=ON", "-DCMAKE_INSTALL_SYSCONFDIR=#{etc}"
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
