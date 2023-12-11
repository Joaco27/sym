class Link < ApplicationRecord

  # Validaciones
  validates :original_link, presence: true, format: { with: URI::regexp(%w[http https]), message: 'Debe ser una URL con protocolo http o https' }
  validates :short_link, presence: true
  validates :slug, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9_-]+\z/, message: 'Solo puede contener letras, numeros y guiones' }
  validates :category, presence: true
  validates :expiration, presence: true, if: -> { category == 'Temporal' }
  validates :password, presence: true, if: -> { category == 'Privado' }

  # Relaciones
  has_many :accesses, dependent: :destroy
  belongs_to :user

  # Acciones previas para generar ShortLinks y Slugs
  before_validation :generate_slug
  before_save :generate_short_link

  def access
  end

  def today_access
    0
  end

  def total_access
    0
  end

  def generate_slug
    self.slug ||= SecureRandom.hex(4)
  end

  def generate_short_link
      self.short_link = "https://chq.to/l/#{slug}"
  end
end
