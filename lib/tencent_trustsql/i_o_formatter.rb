require 'tencent_trustsql/i_o_formatter/input'
require 'tencent_trustsql/i_o_formatter/output'

module TencentTrustsql
  module IOFormatter

    def self.included base
      base.instance_variable_set '@input_formatter', Input.new
      base.instance_variable_set '@output_formatter', Output.new
      base.singleton_class.class_eval do
        attr_reader :input_formatter, :output_formatter
      end
    end

  end
end