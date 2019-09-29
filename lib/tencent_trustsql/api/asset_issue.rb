module TencentTrustsql
  module Api
    module AssetIssue

      def asset_apply(node_ip, node_port, options={})
        asset_apply_base __method__, node_ip, node_port, options
      end

      def commit(node_ip, node_port, options={})
        asset_commit_base __method__, node_ip, node_port, options
      end

      # 资产转让申请
      def asset_transfer_apply(node_ip, node_port, options={})
        asset_apply_base __method__, node_ip, node_port, options
      end

      # 资产直接转让提交
      def asset_transfer_submit(node_ip, node_port, options={})
        asset_commit_base __method__, node_ip, node_port, options
      end

      def asset_apply_base name, *args
        url_map = {
          asset_apply: 'asset_issue_apply',
          asset_transfer_apply: 'asset_transfer_apply'
        }
        tencent_api = url_map[name]

        url = "http://#{args[0]}:#{args[1]}/#{tencent_api}"
        params = asset_base_params.merge(args[2])
        http_post(url,params)
      end

      def asset_commit_base name, *args
        url_map = {
          commit: 'asset_issue_submit',
          asset_transfer_submit: 'asset_transfer_submit'
        }
        tencent_api = url_map[name]

        url = "http://#{args[0]}:#{args[1]}/#{tencent_api}"
        params = asset_base_params.merge(args[2])
        user_private_key = params.delete(:user_private_key)
        params[:sign_list] = sign_list_sign user_private_key,params[:sign_list]

        http_post(url,params)
      end


    end
  end
end

