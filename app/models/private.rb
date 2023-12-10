class Private < Link
  validates :password, presence: true

  def access
  end
end
