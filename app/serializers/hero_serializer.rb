class HeroSerializer < ActiveModel::Serializer
  attributes :id, :name, :super_name, :created_at, :updated_at
  has_many :powers
end
