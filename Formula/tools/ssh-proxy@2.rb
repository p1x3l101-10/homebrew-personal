class SshProxyAT2 < Formula
  desc "SSH Proxy Daemon"
  homepage "https://github.com/p1x3l101-10/ssh-proxy"
  version "2.0.2"
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
  depends_on "libssh"
  depends_on "log4cpp"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, "-DCMAKE_INSTALL_SYSCONFDIR=#{etc}"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  service do
    run [bin/"ssh-proxy", "--daemon", "--logfile", var/"log/ssh-proxy@2.log"]
    keep_alive true
  end

  test do
    raise "Test not implemented."
  end

  def caveats
    <<~EOS
      NOTE: THIS PACKAGE IS CURRENTLY IN AN BETA STATE, REPORT ANY BUGS

      ⚠️ Breaking changes in v2 and above:
      The command now requires the `daemon` argument to run the background service.

      You may need to update your usage or manually edit the service with:
        brew services restart ssh-proxy
      
      The config file format has changed, change the name of the table `sshConf` to `connection`
        The following options have been changed:
          config.sshBin - Removed.
      
      The config file has been moved
        It is now at `etc/ssh-proxy/config.toml`
        The default config values have also been exported
          They can be found at `lib/ssh-proxy/config.toml`
    EOS
  end
end
