require 'sequel'

DB = Sequel.connect(
  adapter: 'postgres',
  host: 'localhost',
  database: 'tfbot_test',
  user: 'tfbot',
  password: 'tfbot')

DB.create_table?(:users) do
  primary_key :id
  String      :name
  Boolean     :active
end

DB.create_table?(:characters) do
  primary_key :id
  foreign_key :user_id, :users
  foreign_key :character_descriptions
  foreign_key :active_description
  String      :name
  Boolean     :active
end

DB.create_table?(:character_descriptions) do
  primary_key :id
  foreign_key :character_id
  foreign_key :description_id
end

DB.create_table?(:descriptions) do
  primary_key :id
  foreign_key :user_id
  foreign_key :character_id
  String      :name
  String      :body
  Boolean     :active
end
