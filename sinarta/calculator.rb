require 'Bundler/setup'

Bundler.require

get '/' do 
  erb :index
end

get '/:name' do
  erb :index
end