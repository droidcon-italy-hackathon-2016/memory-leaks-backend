class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo_url, :photo_urls
end
