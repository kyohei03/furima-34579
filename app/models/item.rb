class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :status
  belongs_to :judgment
  belongs_to :cost
  belongs_to :days
  belongs_to :prefecture
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  end

  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :judgment_id
    validates :cost_id
    validates :days_id
    validates :prefecture_id
  end
end

# rails g model status --skip-migration
