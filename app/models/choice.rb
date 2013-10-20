class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :responses
  has_one :survey, through: :question

def percentage
  (Float(self.responses.count) / self.survey.takers.count)*100
end

end
