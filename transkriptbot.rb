class Transkriptbot < Formula
  desc "Automated local audio transcription from emails using whisper.cpp"
  homepage "https://github.com/silkroad78iu/homebrew-transkriptbot"
  head "https://github.com/silkroad78iu/homebrew-transkriptbot.git", branch: "main"

  depends_on "getmail6"
  depends_on "ripmime"
  depends_on "ffmpeg"
  depends_on "pkg-config"

  def install
    system "git", "clone", "https://github.com/ggerganov/whisper.cpp.git"
    cd "whisper.cpp" do
      system "make"
      bin.install "main"
    end

    bin.install "scripts/transkriptbot.sh"
  end
end
