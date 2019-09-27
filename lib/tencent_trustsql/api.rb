Dir["#{File.dirname(__FILE__)}/api/*.rb"].each do |path|
  require path
end
module TencentTrustsql
  module Api

    module AssetIssue
      URL_BASE = "http://123.207.249.116:15910"

      def base_params
        {
          version: "2.0",
          sign_type: 'ECDSA',
          mch_id: mch_id,
          chain_id: 'ch_tencent_testchain',
          timestamp: Time.now.to_i
        }
      end

      BASE_PARAMS = {
        version: "2.0",
        sign_type: 'ECDSA',
        chain_id: 'ch_tencent_testchain'
      }
    end

    module Iss
      BASE_PARAMS = {}
    end

    module CgiBin
      BASE_PARAMS = {}
    end

    module Tpki
      URL_BASE = "https://baas.qq.com/tpki/tpki.TpkiSrv."

      BASE_PARAMS = {
        version: '1.0',
        sign_type: 'ECDSA',
        chain_id: 'ch_tencent_testchain'
      }
      # def base_params
      #   {
      #     version: '1.0',
      #     sign_type: 'ECDSA',
      #     chain_id: 'ch_tencent_testchain',
      #     mch_id: mch_id
      #   }
      # end
    end

  end
end
