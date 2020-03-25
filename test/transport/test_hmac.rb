require 'common'
require 'net/ssh/transport/hmac'

module Transport

  class TestHMAC < NetSSHTest
    Net::BloomfireSSH::Transport::HMAC::MAP.each do |name, value|
      method = name.tr("-", "_")
      define_method("test_get_with_#{method}_returns_new_hmac_instance") do
        key = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!&$%"[0,Net::BloomfireSSH::Transport::HMAC::MAP[name].key_length]
        hmac = Net::BloomfireSSH::Transport::HMAC.get(name, key, { shared: "123", hash: "^&*", digester: OpenSSL::Digest::SHA1 })
        assert_instance_of Net::BloomfireSSH::Transport::HMAC::MAP[name], hmac
        assert_equal key, hmac.key
      end

      define_method("test_key_length_with_#{method}_returns_correct_key_length") do
        assert_equal Net::BloomfireSSH::Transport::HMAC::MAP[name].key_length, Net::BloomfireSSH::Transport::HMAC.key_length(name)
      end
    end

    def test_get_with_unrecognized_hmac_raises_argument_error
      assert_raises(ArgumentError) do
        Net::BloomfireSSH::Transport::HMAC.get("bogus")
      end
    end

    def test_key_length_with_unrecognized_hmac_raises_argument_error
      assert_raises(ArgumentError) do
        Net::BloomfireSSH::Transport::HMAC.get("bogus")
      end
    end
  end

end
