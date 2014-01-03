class Row < ActiveRecord::Base
  has_many :thumbs, dependent: :destroy
  validates :title, presence: true
end
