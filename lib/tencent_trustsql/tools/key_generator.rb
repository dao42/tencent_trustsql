module TencentTrustsql
  module Tools
    module KeyGenerator

      def self.included base
        base.class_eval do
          extend ClassMethods
        end
      end

      module ClassMethods

        # 获取私钥
        def private_key
          group = ECDSA::Group::Secp256k1
          p private_key = 1 + SecureRandom.random_number(group.order - 1)
        end

        # 获取公钥
        # @private_key base64 encoded hex string or integer
        def public_key(private_key)
          if private_key.respond_to? :length
            Base64.decode64(private_key).force_encoding('utf-8').unpack('H*').first.hex
          end

          group = ECDSA::Group::Secp256k1
          public_key =group.generator.multiply_by_scalar(private_key)
          # ECDSA::Format::PointOctetString.encode(public_key, compression: true)
        end




      end

    end
  end
end