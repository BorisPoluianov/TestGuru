class TestProgress < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question
end
