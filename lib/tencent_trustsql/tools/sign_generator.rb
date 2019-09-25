module TencentTrustsql
  module Tools
    module SignGenerator

      def self.included base
        base.class_eval do
          extend ClassMethods
        end
      end


    end
  end
end