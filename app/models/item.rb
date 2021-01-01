class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :estimated_shipping_date

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, inclusion: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :estimated_shipping_date_id, numericality: { other_than: 1 }

end
