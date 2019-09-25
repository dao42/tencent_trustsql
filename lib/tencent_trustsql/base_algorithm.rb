require 'digest'
module TencentTrustsql
  module BaseAlgorithm

    def self.encode(algorithm="SHA256",data)
      Digest::SHA256.hexdigest data
    end


  end

end