module TencentTrustsql
  module IOFormatter
    class Output

      def out_public_key public_key
        public_key_string = ECDSA::Format::PointOctetString.encode(public_key, compression: true)
        Base64.encode64(public_key_string).gsub(/[\n]/, '')
      end

      def out_private_key private_key
        hex = private_key.to_s(16)
        hex_string = [].push(hex).pack('H*')
        Base64.encode64(hex_string).gsub(/[\n]/, '')
      end

      def out_sign signature
        signature_der_string = ECDSA::Format::SignatureDerString.encode(signature)
        Base64.encode64(signature_der_string).gsub(/[\n]/, '')
      end


    end
  end
end