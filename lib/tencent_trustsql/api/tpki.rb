module TencentTrustsql
  module Api
    module Tpki

      def user_get(options={})
        url = URL_BASE + 'UserGet'
        params = BASE_PARAMS.merge(options).merge({
                   timestamp: Time.now.to_i,
                   mch_id: mch_id
                 })
        query = TencentTrustsql.params_to_string params

        p sign = TencentTrustsql.sign(mch_private_key, query)
        p sign_out = TencentTrustsql.output_formatter.out_sign(sign)

        params.merge!({mch_sign: sign_out})

        p url
        p params

        response =HTTP.post(url, :json => params)
        p   response.body.to_s

      end

    end
  end
end