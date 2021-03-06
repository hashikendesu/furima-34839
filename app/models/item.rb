class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :statu
  belongs_to :charge
  belongs_to :area
  belongs_to :delivery_time
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :statu_id
    validates :charge_id
    validates :area_id
    validates :delivery_time_id
  end

  validates :price, numericality: true
  
end
