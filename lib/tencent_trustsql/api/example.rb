module TencentTrustsql
  module Api
    module Example



      def test_idm_user_register(mch_id="gb4pYTAXqzEI9TwDN5")
        url = "https://baas.qq.com/tpki/tpki.TpkiSrv.UserApply"
        params = {
          version: '1.0',
          sign_type: 'ECDSA',
          chain_id: 'ch_tencent_testchain',
          mch_id: mch_id,
          user_id: 1,
          user_pub_key: public_key_out,
          timestamp: Time.now.to_i
        }

        query = params.sort.map do |k, v|
          "#{k}=#{v}" if v.to_s != ''
        end.compact.join('&')
        p query

        p sign = TencentTrustsql.sign(TencentTrustsql.input_formatter.localize_private_key(private_key_out), query)
        p sign_out = TencentTrustsql.output_formatter.out_sign(sign)


      end


    end
  end
end