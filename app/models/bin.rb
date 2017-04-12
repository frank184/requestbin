class Bin < ApplicationRecord
  before_create :set_uuid
  has_many :requests, as: :owner
  validates :uuid, uniqueness: true

  private
    def set_uuid
      self.uuid = loop do
        uuid = SecureRandom.urlsafe_base64
        break uuid unless Bin.where(uuid: uuid).exists?
      end
    end
end
