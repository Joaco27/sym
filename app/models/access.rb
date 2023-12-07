class Access < ApplicationRecord
  validates :ip, presence: true
  belongs_to :link
end
