class Link < ApplicationRecord
  validates :slug, uniqueness: true, presence: true
end
