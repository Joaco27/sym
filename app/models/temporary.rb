class Temporary < Link
  validates :expiration, presence: true

  def access
  end
end
