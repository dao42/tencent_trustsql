module TencentTrustsql
  module Algorithm
    class Sha256

      def self.encode(data)
        Digest::SHA256.digest data
      end

    end
  end
end