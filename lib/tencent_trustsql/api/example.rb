module TencentTrustsql
  module Api
    module Example


      # @params private_key Integer
      # of course you can change it to string by add
      # private_key = TencentTrustsql.input_formatter.localize_private_key(private_key)
      # you can also change this methods to instance methods
      def self.test_idm_user_register(private_key,mch_id="gb4pYTAXqzEI9TwDN5")
        url = "https://baas.qq.com/tpki/tpki.TpkiSrv.UserApply"
        public_key = TencentTrustsql.public_key private_key
        public_key_out = TencentTrustsql.output_formatter.out_public_key(public_key)
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

        p sign = TencentTrustsql.sign(private_key, query)
        p sign_out = TencentTrustsql.output_formatter.out_sign(sign)


      end


    end
  end
end