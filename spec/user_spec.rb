require 'spec_helper'

describe User do
  before { User.create(name: name) }

  let(:name) { "Name" }

  describe '.find_by_name' do
    context 'when the user exists' do
      it 'returns the expected user' do
        expect(User.find_by_name(name)).to_not be_falsey
      end
    end

    context 'when the user does not exist' do
      it 'fails silently' do
        expect(User.find_by_name('Nonexistent')).to be_falsey
      end
    end
  end
end
