class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/" do
    { message: "Welcome to the Home Page" }.to_json 
  end

  patch "/students/:id" do
    student = Student.find(params[:id])
    student.update(
      year_at_school: student.year_at_school + 1
    )
    if student.year_at_school == 8
      student.destroy
    end 
    student.to_json
  end 

  post '/students' do 
    student = Student.create( 
      name: params[:name],
      year_at_school: 1,
      house_id: rand(1..4)
    )
    student.to_json
  end

  delete "/students/:id" do 
    student = Student.find(params[:id])
    student.destroy
    student.to_json
  end 

  get "/houses" do 
    houses = House.all
    houses.to_json(only: [:name, :id])
  end

  get "/houses/:id" do 
   students = House.find(params[:id]).students
   students.to_json(only: [:name, :id])
  end 
  
  get "/students" do 
    students = Student.all
    students.to_json(only: [:name, :id])
  end
end
