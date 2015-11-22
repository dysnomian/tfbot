# Model. Represents a Slack user and associates with their Characters.

class User < Sequel::Model
  one_to_many :characters

  def self.find_by_name(username)
    find(name: username)
  end
end
