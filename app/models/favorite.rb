class Favorite < ActiveRecord::Base
  validates :link, presence: true, uniqueness: true
  validates :title, presence: true
  validates :date, presence: true
end
