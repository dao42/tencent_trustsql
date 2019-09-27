module TencentTrustsql
  class Client

    include Api::Example

    attr_accessor :private_key_out, :public_key_out

    def initialize private_key_out
      @private_key_out = private_key_out
      @public_key_out = TencentTrustsql.encoded_public_key private_key_out
    end







  end
end