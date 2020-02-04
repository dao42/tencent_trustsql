Dir["#{File.dirname(__FILE__)}/api/*.rb"].each do |path|
  require path
end
module TencentTrustsql
  module Api
    module AssetIssue
      URL_BASE = 'http://123.207.249.116:15910'

      def asset_base_params
        {
          version: '2.0',
          sign_type: 'ECDSA',
          mch_id: mch_id,
          timestamp: Time.now.to_i,
          mch_pubkey: mch_public_key_out
        }
      end

    end

    module Iss
      BASE_PARAMS = {}
    end

    module CgiBin
      BASE_PARAMS = {}
    end

    module Tpki
      URL_BASE = 'https://baas.qq.com/tpki/tpki.TpkiSrv.'

      def tpki_base_params
        {
          version: '1.0',
          sign_type: 'ECDSA',
          mch_id: mch_id,
          timestamp: Time.now.to_i
        }
      end
    end

  end
end
