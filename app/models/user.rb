class User < ApplicationRecord
  has_many :tests
  has_many :test_progresses
end
