class Person
  include ActiveModel::Model
  validates :name, presence: true

  attr_accessor :name, :age
end
