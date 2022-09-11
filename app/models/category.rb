class Category < ActiveRecord::Base
    has_many :todos

    def toDoList 
        self.todos.map do |item| 
            item.task
        end
    end
end