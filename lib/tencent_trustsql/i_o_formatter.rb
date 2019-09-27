require 'tencent_trustsql/i_o_formatter/input'
require 'tencent_trustsql/i_o_formatter/output'

module TencentTrustsql
  module IOFormatter
    class << self
      attr_reader :input_formatter, :output_formatter

      def included base
        # 初始化转换器
        instance_variable_set '@input_formatter', instance_variable_get('@input_formatter') || Input.new
        instance_variable_set '@output_formatter', instance_variable_get('@output_formatter') || Output.new


        # mixing类转换器指向已初始化的转换器并提供读方法
        base.instance_variable_set '@input_formatter', input_formatter
        base.instance_variable_set '@output_formatter', output_formatter
        base.singleton_class.class_eval do
          attr_reader :input_formatter, :output_formatter
        end
      end
    end

  end
end