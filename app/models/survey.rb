class Survey < ActiveRecord::Base
  has_many :questions
  has_many :submissions
  has_many :takers, through: :submissions
  belongs_to :creator, class_name: "User"
  has_many :submissions
  has_many :takers, through: :submissions
end
