class SshProxy < Formula
  desc "SSH Proxy Daemon"
  homepage "https://github.com/p1x3l101-10/ssh-proxy"
  version "1.1"
  url "https://github.com/p1x3l101-10/ssh-proxy.git",
    tag: "v#{version}"
  sha256 "823c1a9a237c0dd117bc54cfda59e3202524d70fafbb2b37816116615ef69bbf"
  HEAD "https://github.com/p1x3l101-10/ssh-proxy.git"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, "-DHOMEBREW_ALLOW_FETCHCONTENT=ON"
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