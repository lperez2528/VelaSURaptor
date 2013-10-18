class Survey < ActiveRecord::Base
  has_many :questions
  belongs_to :creator, class_name: "User"
end
