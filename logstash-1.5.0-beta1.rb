require 'formula'

class Logstash150Beta1 < Formula
  homepage 'http://logstash.net/'
  url 'http://download.elasticsearch.org/logstash/logstash/logstash-1.5.0.beta1.tar.gz'
  sha1 '963086de61d418b2da4fab79a165e40c67fabded'

  def install
    inreplace %w{bin/logstash bin/logstash.lib.sh}, /^basedir=.*$/, "basedir=#{libexec}"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/logstash"
  end

  def caveats; <<-EOS.undent
    Logstash 1.4+ emits an unhelpful error if you try to start it without config.
    Please read the getting started guide located at:
    http://logstash.net/docs/latest/tutorials/getting-started-with-logstash
    EOS
  end

  test do
    system "#{bin}/logstash", "--version"
    system "/bin/echo 'hello world' | #{bin}/logstash agent -e 'input { stdin { type => stdin } } output { stdout { codec => rubydebug } }'"
  end
end
