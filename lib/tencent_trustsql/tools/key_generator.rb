module TencentTrustsql
  module Tools
    module KeyGenerator

      # include IOFormatter

      def self.included base
        base.class_eval do
          extend ClassMethods
        end
      end

      module ClassMethods

        # 新建用户私钥
        def user_private_key
          p private_key = 1 + SecureRandom.random_number(CURVE.order - 1)
          output_formatter.out_private_key private_key
        end

        # 获取公钥
        # @private_key base64 encoded hex string or integer
        def public_key(p_key)
          if p_key.respond_to? :length
            p p_key = input_formatter.localize_private_key(p_key)
          end

          public_key = CURVE.generator.multiply_by_scalar(p_key)
          # ECDSA::Format::PointOctetString.encode(public_key, compression: true)
        end

        # 获取公钥字符串
        def encoded_public_key private_key
          pub_key = public_key(private_key)
          output_formatter.out_public_key pub_key
          # public_key_string = ECDSA::Format::PointOctetString.encode(pub_pair, compression: true).force_encoding('utf-8')
          # Base64.encode64(public_key_string).gsub(/[\n]/, '')
        end




      end

    end
  end
end