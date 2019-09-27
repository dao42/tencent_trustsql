module TencentTrustsql

  class << self

    attr_accessor :config

    def configure
      yield self.config ||= Config.new


      # generate reader for config
      # TencentTrustsql.config.mch_private_key == TencentTrustsql.mch_private_key
      config.mch_private_key_local = input_formatter.localize_private_key(config.mch_private_key)
      config.instance_variables.each do |var_sym|
        p "define reader for #{var_sym}"
        singleton_class.define_method var_sym.to_s.gsub(/^@/, '').to_sym do
          config.instance_variable_get var_sym
        end
      end

    end


  end

  class Config
    attr_accessor :mch_private_key, :mch_private_key_local
    # config/initialize/tencent_trustsql.rb
    # TencentTrustsql.configure do |config|
    #   config.mch_private_key = private_key from baas
    # end
  end



end