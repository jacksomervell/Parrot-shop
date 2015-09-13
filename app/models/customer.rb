class Customer < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :parrots, through: :reviews
end
