class Request < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
