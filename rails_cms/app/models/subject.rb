class Subject < ApplicationRecord

  has_many :pages

  scope :visible, lambda { where(visible: true) }
  scope :hidden, lambda { where(visible: false) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])} # using array syntax allows rails to escape SQL in argument being passed in
end
