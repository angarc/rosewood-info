class Survey < ApplicationRecord

  ADDABLE     = false
  EDITABLE    = true
  VIEWABLE    = true
  PUBLISHABLE = false
  DELETEABLE  = true

  belongs_to :user
  has_many :questions, dependent: :destroy

  enum status: [:unpublished, :published]
  enum state: [:closed, :opened]

  validates_uniqueness_of :access_code
  validates_presence_of :title, :access_code

  def label
    "#{self.title}"
  end

end
