# Model. Represents a Slack user and associates with their Characters.

class User < Sequel::Model
  def self.find_by_name(username)
    find(name: username)
  end

  def readable_description
    "#{self.name} #{self.description}".gsub(/#{self.name} #{self.name}/, self.name)
  end
end
