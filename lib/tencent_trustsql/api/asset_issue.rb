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

      # 资产直接转让提交
      # 
      # transaction_id 唯一标识一次交易的ID(资产直接转让申请 返回结果） string
      # sign_list 原待签名串（资产直接转让申请 返回结果） jsonArray
      def asset_transfer_submit transaction_id, sign_list, node_ip = '123.207.249.116' , node_port = '15910', asset_type = 1,chain_id='ch_tencent_testchain'
        action = "asset_issue_submit"
        url = "http://#{node_ip}:#{node_port}/#{action}"
        sign_list_dump = sign_list.dup
      
        # 签名串 签名
        sign_list_array = []
        sign_list_dump.each do |sign_hash|
          sign = TencentTrustsql.trans_sign(mch_private_key, sign_hash["sign_str"] || sign_hash[:sign_str])
          sign_out = TencentTrustsql.output_formatter.out_sign(sign)
          sign_hash["sign"] = sign_out
          sign_list_array << JSON.parse(sign_hash.to_json)
        end
        puts sign_list_array
      
        # 通讯方公钥
        mch_pubkey = TencentTrustsql.encoded_public_key mch_private_key

        params = {}
        params["mch_pubkey"] = mch_pubkey
        params["timestamp"] = Time.now.to_i
        params["sign_list"] =  sign_list_array
        params["chain_id"] =  chain_id
        params["mch_id"] =  mch_id
        params["version"] =  "2.0"
        params["sign_type"] =  "ECDSA"
        params["asset_type"] =  asset_type
        params["transaction_id"] =  transaction_id
     

      p query = TencentTrustsql.params_to_string(params).gsub(':', '').gsub('=>', ':').gsub(' ', '')
        sign = TencentTrustsql.sign(mch_private_key, query)
        sign_out = TencentTrustsql.output_formatter.out_sign(sign)

        p params.merge!({mch_sign: sign_out})
       
        response =HTTP.post(url, json: params)
        p   response.body.to_s

      end
    end
  end
end

