module TencentTrustsql
  module Api
    module AssetIssue

      def apply(options={})

        url = "http://123.207.249.116:15910/asset_issue_apply"
        params = {
            version: '2.0',
            sign_type: 'ECDSA',
            chain_id: 'ch_tencent_testchain',
            mch_id: mch_id,
            timestamp: Time.now.to_i
        }
        params.merge!(options)
        query = params.sort.map do |k, v|
          "#{k}=#{v}" if v.to_s != ''
        end.compact.join('&')
        p query

        p sign = TencentTrustsql.sign(mch_private_key, query)
        p sign_out = TencentTrustsql.output_formatter.out_sign(sign)

        params.merge!({mch_sign: sign_out})

        response =HTTP.post(url, json: params)
        p   response.body.to_s

      end

      def commit(options={})
        url = URL_BASE + '/asset_issue_submit'
        user_private_key = options.delete(:user_private_key)
        params = base_params.merge(options).merge({
                   mch_id: mch_id,
                   timestamp: Time.now.to_i
                 })
        p params
        p sign = TencentTrustsql.trans_sign(user_private_key, params[:sign_list].first['sign_str'])
        p sign_out = TencentTrustsql.output_formatter.out_sign(sign)

        params[:sign_list].first['sign'] = sign_out

        p query = TencentTrustsql.params_to_string(params).gsub(':', '').gsub('=>', ':').gsub(' ', '')
        p sign = TencentTrustsql.sign(mch_private_key, query)
        p sign_out = TencentTrustsql.output_formatter.out_sign(sign)

        params.merge!({mch_sign: sign_out})
        p params
        p url
        response =HTTP.post(url, :json => params)
        p   response.body.to_s

      end

    end
  end
end

