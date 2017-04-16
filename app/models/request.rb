class Request < ApplicationRecord
  belongs_to :owner, polymorphic: true

  def headers
    JSON.parse(super || '{}')
  end

  def params
    JSON.parse(super || '{}')
  end
end
