class Review < ActiveRecord::Base
	belongs_to :reviewed_restaurant, class_name: "Restaurant", foreign_key: :restaurant_id
	belongs_to :reviewer, class_name: "User", foreign_key: :user_id
end
