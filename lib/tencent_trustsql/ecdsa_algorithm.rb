require 'digest/md5'
module TencentTrustsql
  module EcdsaAlgorithm

    def self.sign(private_key,data)
      group = ECDSA::Group::Secp256k1
      digest =TencentTrustsql::BaseAlgorithm.encode(data)
      p "base algorithm : #{digest}"
      temp_key = 1 + SecureRandom.random_number(group.order - 1)
      signature = ECDSA.sign(group, private_key, digest, temp_key)
      ECDSA::Format::SignatureDerString.encode(signature)
    end

  end
end