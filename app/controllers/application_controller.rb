require "pry"
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    messages = Message.all
    messages.to_json
  end

  post '/messages' do
    new_message =  Message.create(username: params[:username], body: params[:body])
    new_message.to_json
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end


  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
  end
  
end