class Presto < Formula
  desc "Distributed SQL query engine for big data"
  homepage "https://prestodb.io"
  url "https://search.maven.org/remotecontent?filepath=io/prestosql/presto-cli/308/presto-cli-308-executable.jar"
  version "308"
  sha256 "fd5440880f48a0d70a49de5b9959ee79ff7bd72bcaf48bcf55118ffca2141e25"

  bottle :unneeded

  depends_on :java => "1.8+"

  def install
    bin.install "presto-cli-#{version}-executable.jar" => "presto"
  end

  test do
    assert_equal "Presto CLI #{version}", shell_output("#{bin}/presto --version").chomp
  end
end
