class Row < ActiveRecord::Base
  has_many :thumbs
  validates :title, presence: true
end
