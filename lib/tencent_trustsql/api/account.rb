module TencentTrustsql
  module Api
    module Account

      def apply_account(private_key_out,options={})
        url = "https://baas.qq.com/tpki/tpki.TpkiSrv.AccountApply"
        public_key_out = TencentTrustsql.encoded_public_key private_key_out
        p u_base_params
        params = u_base_params.merge!({ acc_pub_key: public_key_out })
        params.merge!(options)
        send_request(url,params)
      end

    end
  end
end