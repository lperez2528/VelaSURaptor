class User < ActiveRecord::Base
  has_secure_password
  attr_protected :password_digest

  PUBLIC_ATTRIBUTES = ["first_name", "last_name", "email", "home_city", "birthdate"]
  
  has_many :created_surveys, class_name:"Survey", foreign_key: :creator_id  
  has_many :submissions, foreign_key: :taker_id
  has_many :taken_surveys, through: :submissions, source: :survey

  def name
    "#{first_name} #{last_name}"
  end

  def available_attributes
    attributes.select do |k,v|
      PUBLIC_ATTRIBUTES.include?(k) && v
    end
  end

end
