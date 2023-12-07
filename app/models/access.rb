class Access < ApplicationRecord
  validates :ip, presence: true
end
