module TencentTrustsql
  module Api
    module Example



      def test_idm_user_register private_key_out, user_id
        url = "https://baas.qq.com/tpki/tpki.TpkiSrv.UserApply"

        public_key_out = TencentTrustsql.encoded_public_key private_key_out

        params = {
          version: '1.0',
          sign_type: 'ECDSA',
          chain_id: 'ch_tencent_testchain',
          mch_id: mch_id,
          user_id: user_id,
          user_pub_key: public_key_out,
          timestamp: Time.now.to_i
        }

        query = params.sort.map do |k, v|
          "#{k}=#{v}" if v.to_s != ''
        end.compact.join('&')
        p query

        p sign = TencentTrustsql.sign(mch_private_key, query)
        p sign_out = TencentTrustsql.output_formatter.out_sign(sign)

        params.merge!({mch_sign: sign_out})

        response =HTTP.post(url, :form => params)
        p   response.body.to_s


      end


    end
  end
end