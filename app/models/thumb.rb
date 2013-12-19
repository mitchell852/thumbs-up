class Thumb < ActiveRecord::Base
  belongs_to :row

  validates :label, presence: true, length: { maximum: 20 }
  validates :row, presence: true
end
