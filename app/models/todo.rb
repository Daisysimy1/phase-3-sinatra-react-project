class Todo < ActiveRecord::Base
    belongs_to :category

    def category_name 
        self.category.name
    end
    
    def self.display_with_category
        self.all.to_json(
            include: {
                category: {
                    only: [
                        :name
                    ]
                }
            }
        )
    end

end