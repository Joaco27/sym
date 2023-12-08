class Link < ApplicationRecord
  validates :slug, uniqueness: true, presence: true
  validates :original, presence: true
  has_many :accesses
  # has_one :categories
end
