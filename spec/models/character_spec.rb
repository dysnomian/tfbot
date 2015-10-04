require 'spec_helper'

describe Character do
  let(:character) do
    Character.create(
      user_id: user_id,
      name: name)
  end

  let(:user_id) { 1 }
  let(:name)    { "Green" }

  it 'is valid' do
    expect(character).to be_valid
  end
end
