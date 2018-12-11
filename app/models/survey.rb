class Survey < ApplicationRecord

  ADDABLE     = false
  EDITABLE    = true
  VIEWABLE    = true
  PUBLISHABLE = true
  DELETEABLE  = true

  belongs_to :user
  has_many   :questions, dependent: :destroy
  has_one    :authorized_surveyees_list

  enum status: [:unpublished, :published]
  enum state: [:closed, :opened]

  validates_uniqueness_of :access_code
  validates_presence_of :title, :access_code

  def label
    "#{self.title}"
  end

  def toggle_status
    if self.published?
      self.unpublished!
    else
      self.published!
    end
  end

end
