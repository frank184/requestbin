class Bin < ApplicationRecord
  has_many :requests, as: :owner
  has_secure_token
end
