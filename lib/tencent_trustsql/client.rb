module TencentTrustsql
  class Client

    include Api::AssetIssue
    include Api::Tpki

    attr_accessor :mch_private_key, :mch_id, :mch_public_key_out

    def initialize
      @mch_private_key = TencentTrustsql.mch_private_key_local
      @mch_id = TencentTrustsql.mch_id
      @mch_public_key_out = TencentTrustsql.encoded_public_key  @mch_private_key
    end


    def sign_list_sign user_private_key, sign_list
      signed_list = []
      p "count ------ #{sign_list.count}"
      sign_list.each do |obj|
        signed_obj = {}
        p "obj --------- #{obj}"
        p obj.keys
        [:account, :sign_str, :id].each do |key|
          signed_obj["#{key.to_s}"] = obj[key] || obj[key.to_sym]
        end
        p signed_obj['sign_str']
        p user_private_key
        sign = TencentTrustsql.trans_sign user_private_key, signed_obj['sign_str']
        p a = TencentTrustsql.output_formatter.out_sign(sign)
        signed_obj['sign'] = a#TencentTrustsql.output_formatter.out_sign sign
        signed_list.push signed_obj
      end
      p 'sign_list signed'
      p signed_list
      signed_list
    end

    def http_post url, params
      # sign
      query = TencentTrustsql.params_to_string(params).gsub(':', '').gsub('=>', ':').gsub(' ', '')
      mch_sign = TencentTrustsql.output_formatter.out_sign(TencentTrustsql.sign(mch_private_key, query))

      params.merge!(mch_sign: mch_sign)

      p params
      p url

      response =HTTP.post(url, json:  params)
      JSON.parse(response.body) rescue nil
    end

  end
end