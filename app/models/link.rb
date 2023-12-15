class Link < ApplicationRecord

  # Validaciones
  validates :original_link, presence: true, format: { with: URI::regexp(%w[http https]), message: 'Debe ser una URL con protocolo http o https' }
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

  def is_accesable?
    if self.category == "Efimero" && self.accesses.any?
      return false
    end
    if self.category == "Temporal" && self.expiration < DateTime.now
      return false
    end
    return true
  end

  def today_access
    self.accesses.where('DATE(created_at) = ?', Date.today).count
  end


  def total_access
    self.accesses.count
  end

  def generate_slug
    # Perdon por hacer trampa, uso un while

    return if slug.present? # Si ya tiene un valor, no genero uno nuevo

    potential_slug = SecureRandom.hex(5)
    while Link.exists?(slug: potential_slug)
      potential_slug = SecureRandom.hex(5)
    end

    self.slug = potential_slug
  end

  def generate_short_link
      # Al estar es desarrollo pongo el link acortado con url local
      # self.short_link = "https://chq.to/l/#{slug}"
      self.short_link = "http://127.0.0.1:3000/l/#{slug}"
  end
end
