class HeroSerializer < ActiveModel::Serializer
  attributes :id, :name, :super_name
  has_many :powers, serializer: PowerSerializer, if: -> { @instance_options[:include_powers] }
end
