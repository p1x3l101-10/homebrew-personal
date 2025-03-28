class DndTools < Formula
  desc "Set of interactive command line tools for Dungeons and Dragons 5th Edition"
  homepage "https://gitlab.com/savagezen/dnd-tools"
  license "AGPL-3.0"
  version "2022-07-31_1"
  url "https://gitlab.com/savagezen/dnd-tools.git", revision: "faa09f6c01de423c4e592126e24ad929f8a9f164"

  head "https://gitlab.com/savagezen/dnd-tools.git", branch: "main"

  depends_on "python@3.13"

  def install
    system "mkdir", "-p" "#{bin}"
    system "sed", "s+#!/usr/bin/env python+#!/usr/bin/env python3+; w #{bin}/dnd-tools", "scripts/dnd-tools"
  end
end