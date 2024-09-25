class FjordlauncherCrack < Formula
  desc "Sets a dummy online account so fjordlauncher will let you use authlib"
  homepage "https://github.com/unmojang/FjordLauncher/issues/9#issuecomment-2189912032"
  url "file:///dev/null"
  version "1.0"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "Unlicense"

  def install
    system "mkdir", "-p", "#{share}/fjordlauncher-crack", "#{bin}"
    system "sh", "-c", "echo 'ewogICAgImFjY291bnRzIjogWwogICAgICAgIHsKICAgICAgICAgICAgImFjdGl2ZSI6IHRydWUsCiAgICAgICAgICAgICJwcm9maWxlIjogewogICAgICAgICAgICAgICAgImNhcGVzIjogWwogICAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAgICJpZCI6ICIwIiwKICAgICAgICAgICAgICAgICJuYW1lIjogIlN0ZXZlIiwKICAgICAgICAgICAgICAgICJza2luIjogewogICAgICAgICAgICAgICAgICAgICJpZCI6ICIiLAogICAgICAgICAgICAgICAgICAgICJ1cmwiOiAiIiwKICAgICAgICAgICAgICAgICAgICAidmFyaWFudCI6ICIiCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJ0eXBlIjogIk9mZmxpbmUiLAogICAgICAgICAgICAieWdnIjogewogICAgICAgICAgICAgICAgImV4dHJhIjogewogICAgICAgICAgICAgICAgICAgICJjbGllbnRUb2tlbiI6ICIwIiwKICAgICAgICAgICAgICAgICAgICAidXNlck5hbWUiOiAiU3RldmUiCiAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgImlhdCI6IDAsCiAgICAgICAgICAgICAgICAidG9rZW4iOiAib2ZmbGluZSIKICAgICAgICAgICAgfQogICAgICAgIH0KICAgIF0sCiAgICAiZm9ybWF0VmVyc2lvbiI6IDMKfQo=' | base64 -d > '#{share}/fjordlauncher-crack/accounts.json'"
    system "sh", "-c", "echo '#!/bin/sh' > '#{bin}/fjordlauncher-crack'"
    system "sh", "-c", "echo 'CRACK=#{share}/fjordlauncher-crack/accounts.json' >> #{bin}/fjordlauncher-crack"
    system "sh", "-c", "echo 'UFJFRklYPSIkSE9NRS9MaWJyYXJ5L0FwcGxpY2F0aW9uIFN1cHBvcnQvRmpvcmRsYXVuY2hlciIKCmlmIFsgLWUgIiR7UFJFRklYfS9hY2NvdW50cy5qc29uIiBdOyB0aGVuCiAgZWNobyAiQWNjb3VudHMgbGlzdCBhbHJlYWR5IGV4aXN0cyEiCiAgZWNobyAiQmFja2luZyB1cCBvbGQgZmlsZSBhbmQgcHJvY2VkaW5nIGFueXdheXMuLi4iCiAgbXYgIiR7UFJFRklYfS9hY2NvdW50cy5qc29uIiAiJHtQUkVGSVh9L2FjY291bnRzLmpzb24uYmFrIgpmaQoKY3AgIiR7Q1JBQ0t9IiAiJHtQUkVGSVh9L2FjY291bnRzLmpzb24iCmVjaG8gIkRvbmUhIgo=' | base64 -d >> '#{bin}/fjordlauncher-crack'"
    system "chmod", "+x", "#{bin}/fjordlauncher-crack"
  end
end
