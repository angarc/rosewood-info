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

end
