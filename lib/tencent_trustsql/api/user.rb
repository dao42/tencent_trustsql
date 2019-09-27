module TencentTrustsql
  module Api
    module User

      def params_sort(params={})
        params.sort.map do |k, v|
          "#{k}=#{v}" if v.to_s != ''
        end.compact.join('&')
      end

      def base_params
        {
            version: '1.0',
            sign_type: 'ECDSA',
            mch_id: mch_id,
            timestamp: Time.now.to_i
        }
      end

      def mch_sign(params={})
        p query = params_sort(params)
         sign = TencentTrustsql.sign(mch_private_key, query)
         TencentTrustsql.output_formatter.out_sign(sign)
      end

      def send_request(url,private_key_out,options={})
        public_key_out = TencentTrustsql.encoded_public_key private_key_out
        params = base_params.merge!({ user_pub_key: public_key_out })
        params.merge!(options)

        p sign_out = mch_sign(params)
        params.merge!({ mch_sign: sign_out })

        response =HTTP.post(url, :form => params)
        JSON.parse(response.body)
      end

      def apply(private_key_out,options={})
        url = "https://baas.qq.com/tpki/tpki.TpkiSrv.UserApply"
        send_request(url,private_key_out,options)
      end

      def get_user(private_key_out,options={})
        url = "https://baas.qq.com/tpki/tpki.TpkiSrv.UserGet"
        send_request(url,private_key_out,options)
      end

    end
  end
end