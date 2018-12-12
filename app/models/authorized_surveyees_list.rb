class AuthorizedSurveyeesList < ApplicationRecord

  ADDABLE     = true
  EDITABLE    = true
  VIEWABLE    = true
  PUBLISHABLE = true
  DELETEABLE  = true

  enum status: [:unpublished, :published]
  belongs_to :survey, optional: true

  def toggle_status
    if self.published?
      self.unpublished!
    else
      self.published!
    end
  end

  def includes?(user)
    self.list.split(" ").include?(user)
  end

  def label
    "#{name}"
  end

end
