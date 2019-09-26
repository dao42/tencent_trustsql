module TencentTrustsql
  module IOFormatter
    class Input

      def localize_public_key hex_public_key
        ECDSA::Format::PointOctetString.decode(Base64.decode64(hex_public_key). TencentTrustsql::CURVE)
      end

      def localize_private_key hex_private_key
        Base64.decode64(hex_private_key).unpack('H*').first.hex
      end

      def localize_sign hex_sign

      end


    end
  end
end