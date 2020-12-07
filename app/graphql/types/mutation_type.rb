Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createResort do
    type Types::ResortType
    description 'Creates new Resort'
    argument :name, !types.String
    argument :email, !types.String
    resolve ->(obj, args, ctx) {
      new_resort = Resort.create(name: args[:name], email: args[:email])
      new_resort
    }
  end

  field :createApartment do
    type  Types::ApartmentType
    description 'Creates new Apartment'
    argument :resort_id, !types.ID
    argument :room_type, !types.String
    argument :description, !types.String
    resolve ->(obj, args, ctx) {
      new_apartment = Apartment.create(
          resort_id: args[:resort_id],
          room_type: args[:room_type],
          description: args[:description]
      )
      new_apartment
    }
  end
end
