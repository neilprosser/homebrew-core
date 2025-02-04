class YoutubeDl < Formula
  include Language::Python::Virtualenv

  desc "Download YouTube videos from the command-line"
  homepage "https://youtube-dl.org/"
  url "https://files.pythonhosted.org/packages/db/ea/6c486aedaebb1beb4d9b2a4766d7321d03d118b2aaef1570c81d4617ff85/youtube_dl-2021.3.31.tar.gz"
  sha256 "822be370d9c1bc63ec2ca9634fef1baf12db9c10d2b1f322401c0f1f9d35dcd2"
  license "Unlicense"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "d3583c4af4262153e6867f968af9a709a94c732ce363d2358b3973ff8fdefd1e"
    sha256 cellar: :any_skip_relocation, big_sur:       "bf68d682ef9853a3e553e06d84f03590057fdb0f80d03cfb4fd9f2349c7c5769"
    sha256 cellar: :any_skip_relocation, catalina:      "3338734ee8b04afbd295c37444613ede94ac0be2c328498dfa1a8e56d6762de8"
    sha256 cellar: :any_skip_relocation, mojave:        "ccd9b4bc7735f8aac4e80da80945ab708d2d024eeeeb6565908279d7c63dfe3f"
  end

  depends_on "python@3.9"

  def install
    virtualenv_install_with_resources
    man1.install_symlink libexec/"share/man/man1/youtube-dl.1" => "youtube-dl.1"
    bash_completion.install libexec/"etc/bash_completion.d/youtube-dl.bash-completion"
    fish_completion.install libexec/"etc/fish/completions/youtube-dl.fish"
  end

  test do
    # commit history of homebrew-core repo
    system "#{bin}/youtube-dl", "--simulate", "https://www.youtube.com/watch?v=pOtd1cbOP7k"
    # homebrew playlist
    system "#{bin}/youtube-dl", "--simulate", "--yes-playlist", "https://www.youtube.com/watch?v=pOtd1cbOP7k&list=PLMsZ739TZDoLj9u_nob8jBKSC-mZb0Nhj"
  end
end
