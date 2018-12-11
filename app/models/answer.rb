class Answer < ApplicationRecord

  ADDABLE     = true
  EDITABLE    = true
  VIEWABLE    = true
  PUBLISHABLE = true
  DELETEABLE  = true

  belongs_to :question, optional: true

  def label
    "#{title}"
  end

  def get_percentage_chosen(question)
    self.number_of_times_chosen.to_f / question.total_answers_chosen.to_f
  end

end
