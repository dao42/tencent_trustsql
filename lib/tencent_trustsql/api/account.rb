module TencentTrustsql
  module Api
    module Account

      def params_sort(params={})
        params.sort.map do |k, v|
          "#{k}=#{v}" if v.to_s != ''
        end.compact.join('&')
      end

      def apply(options={})
        url = "https://baas.qq.com/tpki/tpki.TpkiSrv.AccountApply"

        public_key_out = TencentTrustsql.encoded_public_key private_key_out

        params = {
            version: '1.0',
            sign_type: 'ECDSA',
            mch_id: mch_id,
            user_pub_key: public_key_out,
            timestamp: Time.now.to_i
        }
        params.merge!(options)

        p params_sort(params)

        p sign = TencentTrustsql.sign(mch_private_key, query)
        p sign_out = TencentTrustsql.output_formatter.out_sign(sign)

        params.merge!({mch_sign: sign_out})

        response =HTTP.post(url, :form => params)
        JSON.parse(response.body)

      end

      def get(options={})
        url = "https://baas.qq.com/tpki/tpki.TpkiSrv.UserGet"
        public_key_out = TencentTrustsql.encoded_public_key private_key_out

      end

    end
  end
end