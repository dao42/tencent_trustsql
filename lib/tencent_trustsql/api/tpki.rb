module TencentTrustsql
  module Api
    module Tpki

      def user_get user_id
        url = URL_BASE + 'UserGet'
        params = base_params.merge user_id: user_id, timestamp: Time.now.to_i
        query = TencentTrustsql.params_to_string params

        p sign = TencentTrustsql.sign(mch_private_key, query)
        p sign_out = TencentTrustsql.output_formatter.out_sign(sign)

        params.merge!({mch_sign: sign_out})

        p '1231231231231231231231'
        p url
        p params
        p '----------------------'

        response =HTTP.post(url, :json => params)
        p '333333333333333333333333333'
        p   response.body.to_s

      end

    end
  end
end