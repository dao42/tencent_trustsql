require 'digest'
module TencentTrustsql
  module BaseAlgorithm

    def self.encode(data) #algorithm="SHA256"
      Digest::SHA256.digest data #hexdigest
    end

    def self.hex_decode()
      # todo  conver Java: Hex.decode(原字符串) to ruby methods
      "todo hex_decode"
    end


  end

end

# expired