p '123'
Dir["#{File.dirname(__FILE__)}/tools/*.rb"].each do |path|
    require path
end
