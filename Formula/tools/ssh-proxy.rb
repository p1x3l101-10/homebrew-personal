class SshProxy < Formula
  desc "SSH Proxy Daemon"
  homepage "https://github.com/p1x3l101-10/ssh-proxy"
  version "1.6.3"
  url "https://github.com/p1x3l101-10/ssh-proxy.git",
    tag: "v#{version}"
  license "BSD 3 Clause"

  depends_on "cmake" => :build
  depends_on "tomlplusplus" => :build
  depends_on "pkgconf" => :build
  depends_on "boost"

  head do 
    url "https://github.com/p1x3l101-10/ssh-proxy.git",
      branch: "main"
    depends_on "magic_enum" => :build
    depends_on "libssh"
    depends_on "log4cpp"
  end

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, "-DCMAKE_INSTALL_SYSCONFDIR=#{etc}"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  if build.head?
    service do
      run [bin/"ssh-proxy", "--daemon"]
      keep_alive true
      log_path var/"log/ssh-proxy.log"
      error_log_path var/"log/ssh-proxy.log"
    end
  else
    service do
      run bin/"ssh-proxy"
      keep_alive true
      log_path var/"log/ssh-proxy.log"
      error_log_path var/"log/ssh-proxy.log"
    end
  end

  test do
    raise "Test not implemented."
  end

  def caveats
    s = ""
    if build.head?
      s += <<~EOS
        ⚠️ Breaking changes in v2 and above:
        The command now requires the `daemon` argument to run the background service.
  
        You may need to update your usage or manually edit the service with:
          brew services restart ssh-proxy
        
        The config file format has changed, change the name of `sshConf` to `connection`
          The following options have been changed:
            sshBin - Removed.
      EOS
    end
    s unless s.empty?
  end
end
