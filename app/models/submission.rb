class Submission < ActiveRecord::Base
  belongs_to :survey
  belongs_to :taker, class_name: "User"
  has_many :responses
end
