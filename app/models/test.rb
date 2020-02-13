class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_progresses
  has_many :users
end
