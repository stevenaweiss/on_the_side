class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  belongs_to :ingredient
  belongs_to :user
end