class Survey < ActiveRecord::Base
  has_many :questions
  has_many :submissions
  has_many :takers, through: :submissions
  belongs_to :creator, class_name: "User"
  has_many :submissions
  has_many :takers, through: :submissions

  def stats
    stats = []
    
    questions.each do |question|
      question_hash = {}
      question_hash[:text] = question.description
      question_hash[:id] = question.id.to_s
      question_hash[:choices] = []

      question.choices.each do |choice|
        choice_hash = {}
        choice_hash[:text] = choice.text
        choice_hash[:takers] = choice.responses.count
        choice_hash[:percentage] = choice.percentage
        question_hash[:choices] << choice_hash
      end
      stats << question_hash
    end

  stats
  end
end
