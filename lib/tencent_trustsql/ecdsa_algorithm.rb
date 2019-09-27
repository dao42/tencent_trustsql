require 'digest/md5'
module TencentTrustsql
  module EcdsaAlgorithm

    def self.sign(private_key,data)
      # sign = base64（ECDSA (sha256(原字符串))）。签名后的r/s使用DER编码再转成base64表示。
      group = ECDSA::Group::Secp256k1
      digest =TencentTrustsql::BaseAlgorithm.encode(data)
      p "base algorithm : #{digest}"
      temp_key = 1 + SecureRandom.random_number(group.order - 1)

      signature = ECDSA.sign(group, private_key, digest, temp_key)
      ECDSA::Format::SignatureDerString.encode(signature).force_encoding('utf-8')

    end

    def self.sign_ren_string(private_key,sign_str)
      # sign = base64（ECDSA (Hex.decode(原字符串))）。签名后的r/s使用DER编码再转成base64表示。
      group = ECDSA::Group::Secp256k1
      digest =TencentTrustsql::BaseAlgorithm.hex_decode(data)
      p "Hex.decode(原字符串) : #{digest}"
      temp_key = 1 + SecureRandom.random_number(group.order - 1)

      signature = ECDSA.sign(group, private_key, digest, temp_key)
      ECDSA::Format::SignatureDerString.encode(signature).force_encoding('utf-8')
    end


  end
end

# expired