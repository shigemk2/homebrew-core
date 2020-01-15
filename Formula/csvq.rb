class Csvq < Formula
  desc "SQL-like query language for csv"
  homepage "https://mithrandie.github.io/csvq"
  url "https://github.com/mithrandie/csvq/archive/v1.12.3.tar.gz"
  sha256 "2ac5e3b6afe77855bcf680974da262a6f1de2bea87cbe56851ad0e4b46b0c459"

  bottle do
    cellar :any_skip_relocation
    sha256 "67088c11a870a66553890127d8f13a9d808e7fee4093f6b2c81f20dcee232dfa" => :catalina
    sha256 "d0cde7c65b07775e24cfa27de781d592435f93c7383d710a03a4256902d443ff" => :mojave
    sha256 "722817ad9ad57c49027edeee27fbacaa8c4bac377932ce4fd0e86f0547c09355" => :high_sierra
  end

  depends_on "go" => :build

  def install
    system "make"
    bin.install "csvq"
  end

  test do
    system "#{bin}/csvq", "--version"

    (testpath/"test.csv").write <<~EOS
      a,b,c
      1,2,3
    EOS
    expected = <<~EOS
      a,b
      1,2
    EOS
    result = shell_output("#{bin}/csvq --format csv 'SELECT a, b FROM `test.csv`'")
    assert_equal expected, result
  end
end
