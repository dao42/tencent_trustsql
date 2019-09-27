require 'digest'
module TencentTrustsql
  module BaseAlgorithm

    def self.encode(data) #algorithm="SHA256"
      Digest::SHA256.digest data #hexdigest
    end


  end

end

# expired