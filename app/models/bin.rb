class Bin < ApplicationRecord
  before_create :set_uid
  has_many :requests, as: :owner

  private
    def set_uid
      self.uid = SecureRandom.urlsafe_base64
    end
end
