module TencentTrustsql
  module Api
    module Tpki

      def user_apply(private_key_out, options={})
        url = URL_BASE + 'UserApply'
        public_key_out = TencentTrustsql.encoded_public_key private_key_out

        params = {user_pub_key: public_key_out, **tpki_base_params, **options}

        http_post url, params
      end

      def user_get(options={})
        url = URL_BASE + 'UserGet'
        params = tpki_base_params.merge(options)

        http_post url, params
      end

      def account_apply(private_key_out, options={})
        url = URL_BASE + 'AccountApply'
        public_key_out = TencentTrustsql.encoded_public_key private_key_out
        # params = tpki_base_params.merge!({ acc_pub_key: public_key_out })
        params = {acc_pub_key: public_key_out, **tpki_base_params, **options}

        http_post url, params
      end

    end
  end
end