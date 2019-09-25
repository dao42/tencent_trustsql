require "tencent_trustsql/version"
require 'ecdsa'
require 'securerandom'
require 'json'
require "http"

module TencentTrustsql

  # 产生一对公私钥, 并返回
  def self.generate_pair_key
    group = ECDSA::Group::Secp256k1
    p private_key = 1 + SecureRandom.random_number(group.order - 1)
  end

  # 获取公钥
  def self.genrate_public_key(private_key)
    group = ECDSA::Group::Secp256k1
    public_key =group.generator.multiply_by_scalar(private_key)
    # ECDSA::Format::PointOctetString.encode(public_key, compression: true)
  end

  def self.test_idm_user_register(mch_id="gb4pYTAXqzEI9TwDN5",product_code="productA")
    url = "https://baas.qq.com/tpki/tpki.TpkiSrv.UserApply"
    prv_key = TencentTrustsql.generate_pair_key #获取私钥
    public_key = TencentTrustsql.genrate_public_key(prv_key) # 获取公钥
    params = {
        version: '1.0',
        mch_sign: 'sig',
        sign_type: 'ECDSA',
        chain_id: 'ch_tencent_testchain',
        mch_id: mch_id,
        product_code: product_code,
        user_id: 1,
        user_pub_key: public_key,
        timestamp: Time.now.to_i
    }

    p sign = TencentTrustsql::EcdsaAlgorithm.sign(prv_key,params.to_json)
    params.merge!({sign: sign})

    response =HTTP.post(url, :form => params)
    p   response.body.to_s

  end

end


module TencentTrustsql
  class Error < StandardError; end
end
