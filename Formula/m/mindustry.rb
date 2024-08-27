class Mindustry < Formula
  desc " The automation tower defense RTS "
  homepage "https://mindustrygame.github.io/"
  version "146"
  license "GPL3"

  option "without-prebuilt", "Don't download the release jar and build from source instead"
  
  unless build.without? "prebuilt"
    url "https://github.com/Anuken/Mindustry/releases/download/v#{version}/Mindustry.jar"
    sha256 "3ab0e46c3cbdc863529ba05e804847ef00e3dbdb4567b5c27c5e6dce071b93f9"
  else
    url "https://github.com/Anuken/Mindustry.git",
      tag: "v#{version}"
  end

  head "https://github.com/Anuken/Mindustry.git"

  option "without-app", "Don't build an app bundle"

  depends_on "openjdk@17"

  unless build.without? "app"
    uses_from_macos "unzip"
    uses_from_macos "base64"

    def caveats
      <<~EOS
        The app bundle is installed into:
          #{libexec}/Mindustry.app

        Use the following command to link it into your applications folder:
          ln -s #{HOMEBREW_PREFIX}/opt/mindustry/libexec/Mindustry.app ~/Applications/Mindustry.app

        NOTE: The app bundle utilizes symlinkt to slim down the size and deduplicate resources
          This also allows the bundle to automagically update the jre when openjdk@17 is also updated
          To make the app portable, copy the bundle while dereferenceing it like this:
            cp -rL #{libexec}/Mindustry.app ~/Applications/Mindustry.app
      EOS
    end
  end

  def install
    # Build jar if there is a need to
    if ((build.head?) or (build.without? "prebuilt")) and (build.without? "app")
      system "./gradlew", "desktop:dist"
    end

    if (not (build.without? "app")) and not ((build.without? "prebuilt") or (build.head?))
      system "mkdir", "-p", "#{libexec}/Mindustry.app/Contents/MacOS", "#{libexec}/Mindustry.app/Contents/Resources"
      system "unzip", "Mindustry.jar", "-d", buildpath
      system "mv", "icons/icon.icns", "#{libexec}/Mindustry.app/Contents/Resources/icons.icns"
      system "ln", "-s", "#{HOMEBREW_PREFIX}/opt/openjdk@17/libexec/openjdk.jdk", "#{libexec}/Mindustry.app/Contents/Resources/openjdk.jdk" # Use softlink to slim
      system "mv", "Mindustry.jar", "#{libexec}/Mindustry.app/Contents/Resources/Mindustry.jar"
      # Need base64 here because ruby hates this stuff
      ## Info.plist -- Reason: The symbols XML uses conflict with the symbols Ruby uses, the amount of escaping needed would defeat the purpose of making this human-readable
      system "sh", "-c", "echo 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPCFET0NUWVBFIHBsaXN0IFBVQkxJQyAiLS8vQXBwbGUgQ29tcHV0ZXIvL0RURCBQTElTVCAxLjAvL0VOIiAiaHR0cDovL3d3dy5hcHBsZS5jb20vRFREcy9Qcm9wZXJ0eUxpc3QtMS4wLmR0ZCI+CjxwbGlzdCB2ZXJzaW9uPSIxLjAiPgo8ZGljdD4KICA8a2V5PkNGQnVuZGxlR2V0SW5mb1N0cmluZzwva2V5PgogIDxzdHJpbmc+TWluZHVzdHJ5PC9zdHJpbmc+CiAgPGtleT5DRkJ1bmRsZUV4ZWN1dGFibGU8L2tleT4KICA8c3RyaW5nPk1pbmR1c3RyeTwvc3RyaW5nPgogIDxrZXk+Q0ZCdW5kbGVJZGVudGlmaWVyPC9rZXk+CiAgPHN0cmluZz5taW5kdXN0cnkubWFjPC9zdHJpbmc+CiAgPGtleT5DRkJ1bmRsZU5hbWU8L2tleT4KICA8c3RyaW5nPk1pbmR1c3RyeTwvc3RyaW5nPgogIDxrZXk+Q0ZCdW5kbGVJY29uRmlsZTwva2V5PgogIDxzdHJpbmc+aWNvbnMuaWNuczwvc3RyaW5nPgogIDxrZXk+Q0ZCdW5kbGVTaG9ydFZlcnNpb25TdHJpbmc8L2tleT4KICA8c3RyaW5nPjEuMDwvc3RyaW5nPgogIDxrZXk+Q0ZCdW5kbGVJbmZvRGljdGlvbmFyeVZlcnNpb248L2tleT4KICA8c3RyaW5nPjYuMDwvc3RyaW5nPgogIDxrZXk+Q0ZCdW5kbGVQYWNrYWdlVHlwZTwva2V5PgogIDxzdHJpbmc+QVBQTDwvc3RyaW5nPgogIDxrZXk+SUZNYWpvclZlcnNpb248L2tleT4KICA8aW50ZWdlcj4wPC9pbnRlZ2VyPgogIDxrZXk+SUZNaW5vclZlcnNpb248L2tleT4KICA8aW50ZWdlcj4xPC9pbnRlZ2VyPgogIDxrZXk+TlNIaWdoUmVzb2x1dGlvbkNhcGFibGU8L2tleT4KICA8dHJ1ZS8+CjwvZGljdD4KPC9wbGlzdD4=' | base64 -d > #{libexec}/Mindustry.app/Contents/Info.plist"
      ## Runner script -- Reason: The string manipulation that this script uses conflicts with the symbols Ruby uses
      system "sh", "-c", "echo 'IyEvYmluL2Jhc2gKZXhwb3J0IEFQUF9MT0NBVElPTj0iJChjZCAiJChkaXJuYW1lICIkMCIpLy4uLy4uIjsgcHdkKSIKZWNobyAiQVBQX0xPQ0FUSU9OIGlzICR7QVBQX0xPQ0FUSU9OfSIKZXhwb3J0ICJKQVZBX0hPTUUiPSIke0pBVkFfSE9NRTotIiR7QVBQX0xPQ0FUSU9OfS9Db250ZW50cy9SZXNvdXJjZXMvb3Blbmpkay5qZGsvQ29udGVudHMvSG9tZSJ9IgplY2hvICJKQVZBX0hPTUUgaXMgJHtKQVZBX0hPTUV9IgplY2hvICJQcmludGluZyBKYXZhIHZlcnNpb24gaW5mby4uLiIKZXZhbCAiJHtKQVZBX0hPTUV9L2Jpbi9qYXZhIC12ZXJzaW9uIgpleGVjICIke0pBVkFfSE9NRX0vYmluL2phdmEiICItWHN0YXJ0T25GaXJzdFRocmVhZCIgIi1EaHR0cHMucHJvdG9jb2xzPVRMU3YxLjIsVExTdjEuMSxUTFN2MSIgIi1YWDorU2hvd0NvZGVEZXRhaWxzSW5FeGNlcHRpb25NZXNzYWdlcyIgLWphciAiJHtBUFBfTE9DQVRJT059L0NvbnRlbnRzL1Jlc291cmNlcy9NaW5kdXN0cnkuamFyIiAiJEAiCg==' | base64 -d > #{libexec}/Mindustry.app/Contents/MacOS/Mindustry"
      system "chmod", "+x", "#{libexec}/Mindustry.app/Contents/MacOS/Mindustry"

      # Link running script to app bundle, no need to duplicate files
      bin.install_symlink libexec/"Mindustry.app/Contents/MacOS/Mindustry" => "mindustry"
    elsif (not (build.without? "app")) and ((build.without? "prebuilt") or (build.head?))
      system "./gradlew", "desktop:packrMacOS", "--info"
      libexec.install Dir ["build/packr/output/Mindustry.app"]
      # Link running script to app bundle, no need to duplicate files
      bin.install_symlink libexec/"Mindustry.app/Contents/MacOS/Mindustry" => "mindustry"
    # Steps for building w/out app bundle
    elsif build.without? "app"
      if (build.head?) or (build.without? "prebuilt")
        libexec.install "desktop/build/libs/Mindustry.jar"
      else
        libexec.install "Mindustry.jar"
      end
      bin.write_jar_script "#{libexec}/Mindustry.jar", "mindustry", java_version: "17"
    end
  end

  livecheck do
    url "https://github.com/Anuken/Mindustry.git"
  end
end
