require "tencent_trustsql/version"

module TencentTrustsql
  class Error < StandardError; end


  # 产生一对公私钥, 并返回
  def self.generatePairKey
    group = ECDSA::Group::Secp256k1
    p private_key = 1 + SecureRandom.random_number(group.order - 1)
  end
end
