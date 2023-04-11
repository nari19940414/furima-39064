class Address < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :order
end
