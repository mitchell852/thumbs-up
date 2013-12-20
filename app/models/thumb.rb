class Thumb < ActiveRecord::Base
  VALID_LABEL_REGEX = /\A[a-zA-Z0-9\- ]+\z/i

  belongs_to :row

  validates :label, presence: true, length: { maximum: 20 }, format: { with: VALID_LABEL_REGEX }
  validates :row, presence: true
end
