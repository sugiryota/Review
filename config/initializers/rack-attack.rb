class Rack::Attack
  throttle('req/ip', :limit => 10, :period => 5.minutes) do |req|
    req.ip # unless req.path.start_with?('/assets')
  end
end