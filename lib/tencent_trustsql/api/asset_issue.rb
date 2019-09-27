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

      # 资产直接转让提交
      def asset_transfer_submit transaction_id, sign_list, node_ip = '123.207.249.116' , node_port = '15910', asset_type = 1,chain_id='ch_tencent_testchain'
        action = "asset_issue_submit"
        url = "http://#{node_ip}:#{node_port}}/#{action}"
        sign_list_dump = sign_list.dump
        sign_list_dump.each do |sign_hash|
          sign = TencentTrustsql.trans_sign(mch_private_key, sign_hash["sign_str"])
          sign_hash["sign"] = sign
        end
        puts sign_list_dump
        params = {
          "mch_pubkey": mch_pubkey,
          "timestamp": Time.now.to_i,
          # 资产直接转让申请 返回结果 前三个字段
          # sign_list.sign 需要自行计算
          # [
          #     {
          #         "account": "1LpqkE1FrCrumjV4aLLn4kL5P5NbyZ1PYD",
          #         "sign_str": "5bdbc32055c4da8ea784783c41e9bd1b87b2280c1c714a3876e557ca0d4594fc",
          #         "id": 1,
          #         "sign": "MEUCIQDDqFT211U0aWT37n4YVM9Az7vaS4e3qfO1XGBQrhf6SgIgQHvBupvD0csZiiVdvWlq/zPB/flrRcI601pVep0u9Bo="
          #     }
          # ]
          "sign_list": sign_list_dump,
          "chain_id": chain_id,
          "mch_id": mch_id,
          "version": "2.0",
          "sign_type": "ECDSA",
          "asset_type": asset_type,
          "transaction_id": transaction_id
      }
      # TODO 此处可统一封装 >>>>>>>>
      query = params.sort.map do |k, v|
          "#{k}=#{v}" if v.to_s != ''
        end.compact.join('&')
        p query

        p sign = TencentTrustsql.sign(mch_private_key, query)
        p sign_out = TencentTrustsql.output_formatter.out_sign(sign)

        params.merge!({mch_sign: sign_out})
       #  <<<<<<<< TODO 此处可统一封装
        response =HTTP.post(url, json: params)
        p   response.body.to_s

      end
    end
  end
end

