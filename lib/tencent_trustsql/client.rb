module TencentTrustsql
  class Client

    include Api::Example
    include Api::AssetIssue

    attr_accessor :mch_private_key, :mch_id

    def initialize
      @mch_private_key = TencentTrustsql.mch_private_key_local
      @mch_id = TencentTrustsql.mch_id
    end







  end
end