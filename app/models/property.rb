class Property < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
end