require 'grape'
require 'sequel'

DB = Sequel.connect(
  adapter: 'postgres',
  host: 'localhost',
  database: 'tfbot_development',
  user: 'tfbot',
  password: 'tfbot')

# DB.create_table :descriptions do
#   primary_key :id
#   String :character_name
#   String :body
#   Integer :user_id
#   Boolean :active?
# end
#
DB.create_table :users do
  primary_key :id
  String :name
  String :description
  String :slack_id
end

class Description
  def self.all
    @all ||= DB[:descriptions]
  end

  def self.create(body:, user_id:)
    all.insert(body: body, user_id: user_id)
  end
end

module TFBot
  class API < Grape::API
    version 'v1', using: :header, vendor: 'slack'
    format :json
    prefix :api

    resource :descriptions do
      desc 'ping'
      post :ping do
        PONG
      end

      desc 'Set the description for a character.'
      post :set do
        params['command'].split(' ')[1]
      end
    end
  end
end

class User
  attr_accessor :description, :slack_id, :name

  def self.all
    @all ||= DB[:user]
  end

  def self.create(description:, slack_id:, name:)
    all.insert(description: description, slack_id: slack_id, name: name)
  end

  def save
    insert(description: self.description, slack_id: self.slack_id, name: self.name)
  end
end
