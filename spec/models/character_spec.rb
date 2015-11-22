require 'spec_helper'

describe Character do

  let(:character) do
    Character.create(
      name: name,
    )
  end

  let(:name)        { "Green" }
  let(:description) { Description.create(body: 'is a description') }

  it 'is valid' do
    expect(character).to be_valid
  end

  # TODO: Refactor tests
  describe '#readable_description' do
    let(:expected_description) { 'Green is a description' }

    it 'returns a human_formatted description' do
      character.descriptions << description
      expect(character.readable_description).to eq(expected_description)
    end

    it 'removes the second occurence of a name' do
      character.descriptions << Description.create(body: "Green is a description.")
      expect(character.readable_description).to eq("Green is a description.")
    end
  end

end
