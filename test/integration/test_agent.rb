require_relative 'common'

require 'net/ssh'

# rubocop:disable LineLength
CERT = "\x00\x00\x00\x1Cssh-rsa-cert-v01@openssh.com\x00\x00\x00 Ir\xB9\xC9\x94l\x0ER\xA1h\xF5\xFDx\xB2J\xC6g\eHS\xDD\x162\x86\xF1\x90%\\$rf\xAF\x00\x00\x00\x03\x01\x00\x01\x00\x00\x01\x01\x00\xB3R\xBC\xF8\xEA\xA30\x90\x87\x85\xF6m\x80\xFB\x7F\x96%\xC0h\x85$\x05\x05J\x9BE\xD9\xDE\x81\xC0\xC9\xC2\xC0\x0F'\xD1TR\xCBb\xCD\xD0o\xA0\x15Q\x8B\xF26t\xC9!8\x85\xD2\f'\xC6\x14u\x1De\x90qyXl\a\x06\xA7\xD0\xB8 \xE1\xB3IP\xDE\xB5\xBE\x19\x0E\x97-M\xFDJT\x81\xE2\x8E>\xCD\x18\x9CJz\x1C\xB5}LsO\xF3\xAC\xAA\r\xAB\xF9\xD4\x83\x8DQ\x82\xE7F\xA4\x9F\x1C\x9A\xC5\xC3Y\x84k\x86\ef\xD7\x84\xE3\v\rlG\x15ya\xB0=\xDF\x11\x8D\x0FtZ/p\xBB\xB7g\xF5\xEBF8\xF5\x05}}\xDB\xFA\xA34dw\xE5\x80\xBC!=\x0E\x96\x18\bF\x10\a{\xFF\x9D2\xCA\xAAnu\x82\x82\xBA-F\x8C\x12\xBB\x04+nh\xE9N\xAF\fe\x16\x00Q\x9C\x1C\xCB\x94\x02\x8CQ\xFB,H[\x96\xF1Z4\nY]@\xE0\bs\x9Bh\x0E\xAA~\x105\x99\\\x8C\xA7q\x1A=\xA9\x9D\xBAbx\xF5`[\x8Aw\x80\b\xE0vy\x00\x00\x00\x00\x00\x00\x00c\x00\x00\x00\x01\x00\x00\x00\x06foobar\x00\x00\x00\b\x00\x00\x00\x04root\x00\x00\x00\x00Xk\\\x1C\x00\x00\x00\x00ZK>g\x00\x00\x00#\x00\x00\x00\rforce-command\x00\x00\x00\x0E\x00\x00\x00\n/bin/false\x00\x00\x00c\x00\x00\x00\x15permit-X11-forwarding\x00\x00\x00\x00\x00\x00\x00\x16permit-port-forwarding\x00\x00\x00\x00\x00\x00\x00\npermit-pty\x00\x00\x00\x00\x00\x00\x00\x0Epermit-user-rc\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x17\x00\x00\x00\assh-rsa\x00\x00\x00\x03\x01\x00\x01\x00\x00\x01\x01\x00\x9DRU\x0E\x83\x8Eb}\x81vOn\xCA\xBA\x01%\xFE\x87\x80b\xB5\x98R%\xA9(\xC1\xAE\xEFq|\x82L\xADQ?\x1D\xC6o\xB8\xD8pI\e\xFC\xF8\xFE^\xAD*\xA4u;\x99S\fc\x11\xBE\xFD\x047B\x1C\xF2h\xBA\xB1\xB0\n\x12F\e\x16\xF7Z\x8D\xD3\xF2f\xC0\x1C\xD8\xBE\xCC\x82\x85Qka$\xB6\xBD\x1C)\x85B\xAAf\xC8\xF3V*\xC3\x1C\xAA\xDC\xC3I\xDDe\xEFu\x02M\x12\x1A\xE2};he\x9D\xB5\xA47\xE4\x12\x8F\xE0\xF1\xA5\x91/\xFB\xEA\t\x0F \x1E\xB4B@+6\x1F\xBD\xA7\xA9u\x80\x19\xAA\xAC\xFFK\\F\x8C\xD9u\f?\xB9#[M\xDF\xB0\xFC\xE8\xF6J\x98\xA4\x99\x8F\xF9]\x88\x1D|A%\xAB\e\x0EN\xAA\xD3 \xCF\xA7}c\xDE\xF5\xBA4\xC8\xD2\x81(\x13\xB3\x94@fC\xDC\xDF\xFD\xA1\e$?\x13\xA9m\xEB*\xCA'\xB3\x19\x19\xF0\xD2\xB3P\x00\x96ou\xE90\xC4-\x1F\xCF\x1Aw\x034\xC6\xDF\xA7\x8C\xCA^Ix\x15\xFA\x9A+\x00\x00\x01\x0F\x00\x00\x00\assh-rsa\x00\x00\x01\x00I\b%\x01\xB2\xCC\x87\xD7\e\xC5\x88\x93|\x9D\xEC}\xA4\x86\xD7\xBB\xB6\xD3\x93\xFD\\\xC73\xC2*\aV\xA2\x81\x05J\x91\x9AEKV\n\xB4\xEB\xF3\xBC\xBAr\x16\xE5\x9A\xB9\xDC(0\xB4\x1C\x9F\"\x9E\xF9\x91\xD0\x1F\x9Cp\r*\xE3\x8A\xD3\xB9W$[OI\xD2\x8F8\x9B\xA4\x9E\xFFuGg\x00\xA5\xCD\r\xDB\x95\xEE)_\xC3\xBCi\xA2\xCC\r\x86\xFD\xE9\xE6\x188\x92\xFD\xCC\n\x98t\x8C\x16\xF4O\xF6\xD5\xD4\xB7\\\xB95\x19\xA3\xBBW\xF3\xF7r<\xE6\x8C\xFC\xE5\x9F\xBF\xE0\xBF\x06\xE7v\xF2\x8Ek\xA4\x02\xB6fMd\xA5e\x87\xE1\x93\xF5\x81\xCF\xDF\x88\xDC\a\xA2\e\xD5\xCA\x14\xB2>\xF4\x8F|\xE5-w\xF5\x85\xD0\xF1F((\xD1\xEEE&\x1D\xA2+\xEC\x93\xE7\xC7\xAE\xE38\xE4\xAE\xF7 \xED\xC6\r\xD6\x1A\xE1#<\xA2)j\xB3TA\\\xFF;\xC5\xA6Tu\xAAap\xDE\xF4\xF7 p\xCA\xD2\xBA\xDC\xCDv\x17\xC2\xBCQ\xDF\xAB7^\xA1G\x18\xB9\xB2F\x81\x9Fq\x92\xD3".force_encoding('BINARY')

ED25519 = <<-EOF
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACDuVIPDUXcVkXOyNAaFsotbySHLNG/Gw6gc3j2k2zcRVAAAAKD6bG5++mxu
fgAAAAtzc2gtZWQyNTUxOQAAACDuVIPDUXcVkXOyNAaFsotbySHLNG/Gw6gc3j2k2zcRVA
AAAEAydU4FtZ9+5o5Y/m1aPNHFda37Fm0Us5FlUKx50tWw+e5Ug8NRdxWRc7I0BoWyi1vJ
Ics0b8bDqBzePaTbNxFUAAAAGmJhcnRsZUBCYXJ0bGVzLU1hY0Jvb2stUHJvAQID
-----END OPENSSH PRIVATE KEY-----
EOF

class TestAgent < NetSSHTest
  include IntegrationTestHelpers

  def setup
    @keys = [
      OpenSSL::PKey::RSA.new(1024),
      OpenSSL::PKey::DSA.new(512),
      OpenSSL::PKey::EC.new("prime256v1").generate_key
    ]
    @keys << Net::BloomfireSSH::Authentication::ED25519::PrivKey.read(ED25519, nil) if Net::BloomfireSSH::Authentication::ED25519Loader::LOADED
    @keys += @keys.map do |key|
      cert = Net::BloomfireSSH::Buffer.new(CERT).read_key
      cert.key = key
      cert.sign!(key)
    end
  end

  def test_ssh_agent_add_and_remove
    with_agent do
      agent = Net::BloomfireSSH::Authentication::Agent.connect
      agent.remove_all_identities
      @keys.each do |key|
        agent.add_identity(key, "key")
        assert_equal [key.to_blob], agent.identities.map(&:to_blob)
        agent.remove_identity(key)
        assert agent.identities.empty?
      end
    end
  end

  def test_ssh_agent_add_and_remove_all_identities
    with_agent do
      agent = Net::BloomfireSSH::Authentication::Agent.connect
      agent.remove_all_identities
      @keys.each do |key|
        agent.add_identity(key, "key")
      end
      assert_equal @keys.length, agent.identities.length
      agent.remove_all_identities
      assert agent.identities.empty?
    end
  end
end
