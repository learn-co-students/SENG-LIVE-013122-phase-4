# For implementation, see 'production_serializer.rb' (Line 15)

class ProductionUserSerializer < ActiveModel::Serializer
	attributes :name, :email
end
