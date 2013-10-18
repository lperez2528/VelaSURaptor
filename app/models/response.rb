class Response < ActiveRecord::Base
  belongs_to :choice
  belongs_to :submission
end
