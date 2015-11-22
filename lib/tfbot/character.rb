class Character < Sequel::Model
  many_to_one :user
  one_to_many :descriptions
  #has_one :active_description, :descriptions

  def readable_description
    "#{self.name} #{self.description}".gsub(/#{self.name} #{self.name}/, self.name)
  end

  def description
    self.descriptions.first.body
  end
end
