class Question < ApplicationRecord

  ADDABLE     = true
  EDITABLE    = true
  VIEWABLE    = true
  PUBLISHABLE = true
  DELETEABLE  = true

  belongs_to :survey, optional: true
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: proc { |att| att['title'].blank? }

  def label
    "#{title}"
  end

  def total_answers_chosen
    total = 0
    self.answers.each do |answer|
      total = total + answer.number_of_times_chosen
    end
    total
  end

end
