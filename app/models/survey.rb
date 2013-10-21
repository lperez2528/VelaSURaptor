class Survey < ActiveRecord::Base
  has_many :questions
  has_many :submissions
  has_many :takers, through: :submissions
  belongs_to :creator, class_name: "User"
  has_many :submissions
  has_many :takers, through: :submissions

  def stats
    questions_ary = []
    
    questions.each do |question|
      question_data = {}
      question_data[:text] = question.description
      question_data[:id] = question.id.to_s
      question_data[:choices] = [["Choice", "Percentage"]]        

      question.choices.each do |choice|
        choice_ary = [choice.text, choice.responses.count]
        question_data[:choices] << choice_ary
      end
      questions_ary << question_data
    end

  questions_ary
  end
end
