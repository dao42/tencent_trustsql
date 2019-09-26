module TencentTrustsql
  module Tools
    module SignGenerator

      def self.included base
        base.class_eval do
          extend ClassMethods
        end
      end

      def sign private_key, data
        digest =TencentTrustsql::BaseAlgorithm.encode(data)
        temp_key = 1 + SecureRandom.random_number(group.order - 1)
        signature = ECDSA.sign(TencentTrustsql::CURVE, private_key, digest, temp_key)
      end


    end
  end
end