class Message < ApplicationRecord
  resourcify
  belongs_to :user
  has_many :comments
end
