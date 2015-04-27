class Restaurant < ActiveRecord::Base
	has_many :reservations, dependent: :destroy
	has_many :users, through: :reservations

	has_many :reviews, dependent: :destroy
	has_many :reviewers, through: :reviews

	belongs_to :category

end
