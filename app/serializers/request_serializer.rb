class RequestSerializer < ActiveModel::Serializer
  attributes :id, :headers, :params
end
