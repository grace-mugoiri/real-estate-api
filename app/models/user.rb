class User < ApplicationRecord
	has_secure_password
	has_many :properties
	has_many :favorites, dependent: :destroy

	validates :username, presence: true
	validates :username, uniqueness: true
	validates :username, length: { minimum: 4 }
	validates :email, presence: true
	validates :email, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	def favorite(property)
		favorites.find_or_create_by(property: property)
	end

	def unfavorite(property)
		favorites.where(property: property).destroy.all
	end

	def favorited?(property)
		favorites.find_by(property_id: property.id).present?
	end
end
