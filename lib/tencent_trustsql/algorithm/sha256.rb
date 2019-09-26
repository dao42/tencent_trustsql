module TencentTrustsql
  module Algorithm
    class Sha256

      def self.encode(data) #algorithm="SHA256"
        Digest::SHA256.digest data #hexdigest
      end

    end
  end
end