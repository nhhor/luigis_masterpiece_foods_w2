class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}

    scope :most_recent_products, -> { order(created_at: :desc).limit(3)}

    scope :made_in_the_usa, -> { where(country_of_origin: "USA") }

    before_save(:titleize_product)

    private
    def titleize_product
      self.name = self.name.titleize
    end

  end
