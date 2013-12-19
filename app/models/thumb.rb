class Thumb < ActiveRecord::Base
  belongs_to :row

  validates :label, presence: true, length: { maximum: 20 }
end
