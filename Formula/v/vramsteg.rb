class Vramsteg < Formula
  desc "Add progress bars to command-line applications"
  homepage "https://gothenburgbitfactory.org/vramsteg/"
  url "https://github.com/GothenburgBitFactory/vramsteg/releases/download/v1.1.0/vramsteg-1.1.0.tar.gz"
  sha256 "9cc82eb195e4673d9ee6151373746bd22513033e96411ffc1d250920801f7037"
  license "MIT"
  head "https://github.com/GothenburgBitFactory/vramsteg.git", branch: "1.1.1"

  livecheck do
    url "https://gothenburgbitfactory.org"
    regex(/href=.*?vramsteg[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  no_autobump! because: :requires_manual_review

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "0fc0621375da82a15b6a36551f6fe423df69a79c656beae75ce15a6e6c331556"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "f122182d7989681603772e5ca869e722b9a358e170f2f60135c635a51142a6a2"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "2158611ee7a141add85d1e540484a167ca3ba679d9e0ce60d9381b938e20ecb1"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "efdbbb479580eea937df42d340735d4d621783ba8fdff2987a4ac05b38623dbf"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "a7bc2f2c1ca7f14f5c6551f48907f9be12b623c5ebc16cd454afefe337760336"
    sha256 cellar: :any_skip_relocation, sonoma:         "824cff846fd4ad84038fc095676cf1e64927c7414742a536b9f0679f6adebd1c"
    sha256 cellar: :any_skip_relocation, ventura:        "b1bd6ff70efa1795e140c5dd958bc9faab78c6ad0bc6be86c191e09aa53398a7"
    sha256 cellar: :any_skip_relocation, monterey:       "0464b7532d2b80277a1c560422b20affe4e7b5ce41b8d5e33937a5038fe35993"
    sha256 cellar: :any_skip_relocation, big_sur:        "d004f9d2ef1b642f8128c368e57235f6d2580fd90d928da9996684430a6881ee"
    sha256 cellar: :any_skip_relocation, catalina:       "a6f6f99e3b12dca8a56919d1144b10e43a9059e7691d56dfdf8aab330e6febe8"
    sha256 cellar: :any_skip_relocation, mojave:         "a868fba582ce440a14ae18d4be193209e7d25fd3291b568bea7f123e61aa044d"
    sha256 cellar: :any_skip_relocation, high_sierra:    "0c9aff3582ad05a388cba8c43770ead295d921a8e419323a3c4115f09e609ba1"
    sha256 cellar: :any_skip_relocation, sierra:         "7f65668b7bb036fb19e69bdc9cbc2ec48728bc8c1936253f6d5e8d74a113a3fd"
    sha256 cellar: :any_skip_relocation, el_capitan:     "e4b3e2e66c2f772a38de529b884091a2ffa1f920af6604696129d21cc9e70b99"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "c7d833b721091e38b120fb58944129769f20109b74d881735f7ab1dadf62b487"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "17541c74c89bdac3887fca1b40afe76b5a1778aef0ccb8dd092d04088ed3b281"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # Check to see if vramsteg can obtain the current time as epoch
    assert_match(/^\d+$/, shell_output("#{bin}/vramsteg --now"))
  end
end
