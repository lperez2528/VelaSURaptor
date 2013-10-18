class User < ActiveRecord::Base
  has_secure_password
  
  has_many :created_surveys, class_name:"Survey", foreign_key: :creator_id  
  has_many :submissions, foreign_key: :taker_id
  has_many :taken_surveys, through: :submissions, source: :survey

  def name
    "#{first_name} #{last_name}"
  end

end
