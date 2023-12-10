class Link < ApplicationRecord
  validates :slug, uniqueness: true, presence: true
  validates :original, presence: true
  has_many :accesses, dependent: :destroy
  #belongs_to :user
  # has_one :categories

  def access
  end

  def today_access
    0
  end

  def total_access
    0
  end
end
