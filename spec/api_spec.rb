require 'spec_helper'

SERVER_URI = 'http://localhost:9292/api/'
TOKEN      = 'gIkuvaNzQIHg97ATvDxqgjtO'

def request(method:, path:, command:, user_name: 'greenthedragon')
  request_json = {
    token:        TOKEN,
    team_id:      'T0001',
    team_domain:  'example',
    channel_id:   'C2147483705',
    channel_name: 'test',
    user_id:      'U2147483697',
    user_name:    user_name,
    command:      command,
    text:         '94070'
  }.to_json

  eval "curl -X #{method} -d #{request_json} #{SERVER_URI}#{path}"\
    " -H Content-Type:application/json"
end

describe API do

  describe '/examine' do
    before do
      request(
        method: 'GET',
        path: 'descriptions/examine',
        command: command,
        user_name: 'greenthedragon')
    end

    context 'with a Slack username' do
      let(:command) { '/examine @kyborg' }

      it "returns the description of the user's active character"
    end

    context 'with a valid, unambiguous character name' do
      let(:command) { '/examine Kylie' }

      it "returns the description of the character"
    end

    context 'with a valid, ambiguous character name' do
      let(:command) { '/examine Kylie' }

      it "asks the user which character they meant"
    end

    context 'with a namespaced character name' do
      let(:command) { '/examine kyborg:Kylie' }

      it "returns the character description"
    end

    context 'with one of the characters descriptions' do
      let(:command) { '/examine Veli' }

      it "returns the character description"
    end
  end
end
