class AuthorizedSurveyeesList < ApplicationRecord

  ADDABLE     = true
  EDITABLE    = true
  VIEWABLE    = true
  PUBLISHABLE = true
  DELETEABLE  = true

  enum status: [:unpublished, :published]

  def toggle_status
    if self.published?
      self.unpublished!
    else
      self.published!
    end
  end

  def label
    "#{name}"
  end

end
