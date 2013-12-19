class Thumb < ActiveRecord::Base
  validates :label, presence: true, length: { maximum: 20 }
end
