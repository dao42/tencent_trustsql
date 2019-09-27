module TencentTrustsql
  class Client

    include Api::Example

    attr_accessor :private_key_out, :public_key_out, :mch_private_key, :user__id

    def initialize private_key_out, user_id
      @private_key_out = private_key_out
      @user_id = user_id
      @public_key_out = TencentTrustsql.encoded_public_key private_key_out
      @mch_private_key = TencentTrustsql.mch_private_key_local
    end







  end
end