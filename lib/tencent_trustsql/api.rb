Dir["#{File.dirname(__FILE__)}/api/*.rb"].each do |path|
  require path
end
module TencentTrustsql
  module API

    module AssetIssue
      BASE_PARAMS = {}
    end

    module Iss
      BASE_PARAMS = {}
    end

    module CgiBin
      BASE_PARAMS = {}
    end

    module Tpki
    end

  end
end
