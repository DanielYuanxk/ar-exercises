class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :apparel
  def apparel
    return unless !mens_apparel && !womens_apparel

    errors.add(:mens_apparel, "must carry men's or women's apparel")
    errors.add(:womens_apparel, "must carry men's or women's apparel")
  end
end
