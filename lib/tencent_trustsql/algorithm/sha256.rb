module TencentTrustsql
  module Algorithm
    module Sha256

      def encode(data) #algorithm="SHA256"
        Digest::SHA256.digest data #hexdigest
      end

    end
  end
end