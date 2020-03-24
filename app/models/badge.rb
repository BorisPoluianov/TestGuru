class Badge < ApplicationRecord
  has_many :users, through: :badged_users
  has_many :badged_users, dependent: :destroy

  validates :title, :image, :rule, :rule_parameter, presence: true

  RULES = [
      ['Category tests passed'],
      ['Test passed with first attempt'],
      ['Level passed']
    ]
end
