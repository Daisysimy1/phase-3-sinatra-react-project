class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    require 'pry'
    
    # Add your routes here
    get "/" do
      { message: "Welcome to my project!" }.to_json
    end
  
    get '/todos' do 
      Todos.display_with_category
    end
  
    # get '/todos/:id' do 
    #   todo = Todos.find(params[:id])
    #   todo.display_with_category
  
    # end
  
    post '/todos' do 
      toDoItem = Todos.create(
        task: params[:task],
        category_id: params[:category_id]
      )
      toDoItem.to_json(include: :category)
    end
  
    delete '/todos/:id' do 
      toDoItem = Todos.find(params[:id])
      toDoItem.destroy
      toDoItem.to_json
    end
  
    patch '/todos/:id' do 
      toDoItem = Todos.find(params[:id])
      # binding.pry
      toDoItem.update(
        task: params[:task],
        category_id: params[:category_id]
      )
      toDoItem.to_json(include: :category)
    end
  
    get '/categories' do 
      categories = Category.all
      categories.to_json
    end
  
    post '/categories' do 
      category_item = Category.create(name: params[:name])
      category_item.to_json
    end
  
  end