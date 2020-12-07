# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Resort.delete_all
Resort.reset_pk_sequence
Resort.create([
                  { name: 'Bellagio', email: 'bellagio@gmail.com', description: 'Bellagio is a resort, luxury hotel and casino on the Las Vegas Strip in Paradise, Nevada.' },
                  { name: 'The Mirage', email: 'mirage@gmail.com', description: 'The Mirage is a 3,044-room Polynesian-themed casino resort on the Las Vegas Strip in Paradise, Nevada, United States.' },
                  { name:'Caesars Palace', email:'caesars@gmail.com', description: 'contains many statues, columns and iconography typical of Hollywood Roman period productions including a 20-foot (6.1 m) statue of Augustus Caesar near the entrance. '}
              ])

Apartment.delete_all
Apartment.reset_pk_sequence
Apartment.create([
                     { room_type: 'Single', resort_id: 1, description: 'A room assigned to one person. May have one or more beds.' },
                     { room_type: 'Double', resort_id: 1, description: 'A room assigned to two people. May have one or more beds.' },
                     { room_type: 'Triple', resort_id: 2, description: 'A room assigned to three people. May have two or more beds.' },
                     { room_type: 'Quad', resort_id: 2, description: 'A room assigned to four people. May have two or more beds.' },
                     { room_type: 'Queen', resort_id: 3, description: 'A room with a queen-sized bed. May be occupied by one or more people.' },
                     { room_type: 'King', resort_id: 3, description: 'A room with a king-sized bed. May be occupied by one or more people.' }
                 ])