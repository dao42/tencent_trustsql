require 'tencent_trustsql/algorithm/sha256'
module TencentTrustsql
  module Tools
    module SignGenerator

      def self.included base
        base.class_eval do
          extend ClassMethods
        end
      end

      module ClassMethods

        def params_to_string items
          query = items.sort.map do |k, v|
            "#{k}=#{v}" if v.to_s != ''
          end.compact.join('&')
          puts query
          query
        end

        def sign private_key, data
          private_key = private_key.to_i
          digest = Algorithm::Sha256.encode(data)
          temp_key = 1 + SecureRandom.random_number(TencentTrustsql::CURVE.order - 1)
          signature = ECDSA.sign(TencentTrustsql::CURVE, private_key, digest, temp_key)
        end

        def trans_sign private_key, data
          private_key = private_key.to_i
          digest = [].push(data).pack('H*')
          temp_key = 1 + SecureRandom.random_number(TencentTrustsql::CURVE.order - 1)
          signature = ECDSA.sign(TencentTrustsql::CURVE, private_key, digest, temp_key)
        end

      end

    end
  end
end