module TencentTrustsql
  class Client

    include Api::Example
    include Api::AssetIssue
    include Api::User
    include Api::Account
    include Api::Tpki

    attr_accessor :mch_private_key, :mch_id

    def initialize
      @mch_private_key = TencentTrustsql.mch_private_key_local
      @mch_id = TencentTrustsql.mch_id
    end


    def http_post dir, opts={}
      case dir
        when 'other' then ''

      end
    end
    
  end
end