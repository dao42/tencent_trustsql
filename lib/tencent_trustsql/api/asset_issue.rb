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
    end
  end
end

