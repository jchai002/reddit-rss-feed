class Feed < ActiveRecord::Base
  validates :query, presence: true, uniqueness: true
end
