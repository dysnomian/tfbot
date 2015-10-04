require 'spec_helper'

describe User do
    let(:user)          { User.new(name: existing_name, description: "is a description") }
    let(:existing_name) { "Name" }

  describe '#readable_description' do
    let(:expected_description) { 'Name is a description' }

    it 'returns a human_formatted description' do
      expect(user.readable_description).to eq(expected_description)
    end

    it 'removes the second occurence of a name' do
      user.description = "Name is a description."
      expect(user.readable_description).to eq("Name is a description.")
    end
  end

  describe '.find_by_name' do
    let(:user) { User.create(name: existing_name, description: "is a description") }

    context 'when the user exists' do
      it 'returns the expected user' do
        expect(User.find_by_name(existing_name)).to_not be_falsey
      end
    end

    context 'when the user does not exist' do
      it 'fails silently' do
        expect(User.find_by_name('Nonexistent')).to be_falsey
      end
    end
  end
end
