module TencentTrustsql
  module Api
    module AssetIssue

      def asset_base_params
        {
            version: '2.0',
            sign_type: 'ECDSA',
            mch_id: mch_id,
            timestamp: Time.now.to_i
        }
      end

      def send_json_request(url,params)
        p sign_out = mch_sign(params)
        p params.merge!({ mch_sign: sign_out })
        response =HTTP.post(url, json:  params)
        JSON.parse(response.body)
      end

      def asset_apply(options={})
        url = "http://123.207.249.116:15910/asset_issue_apply"
        params = asset_base_params.merge!(options)
        send_json_request(url,params)
      end
    end
  end
end

