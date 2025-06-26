class Transkriptbot < Formula
  desc "Simple transcript CLI tool"
  homepage "https://github.com/silkroad78iu/transkriptbot"
  url "https://github.com/silkroad78iu/transkriptbot/archive/refs/tags/v0.1.tar$
  sha256 "1b4276d4c5048c8308442ba6d045dd3e627bfa75409f8c5a03571d603c3ea2ba"
  license "MIT"
  head "https://github.com/silkroad78iu/transkriptbot.git", branch: "main"

  def install
    system "g++", "main.cpp", "-o", "transkriptbot"
    bin.install "transkriptbot"
  end

  test do
    system "#{bin}/transkriptbot", "--help"
  end
end
