require 'spec_helper'

describe Description do
  let(:description) do
    Description.create(
      name:         name,
      user_id:      'U2147483697',
      character_id: character_id,
      body:         body,
      active:       active)
  end

  let(:name)         { "Green" }
  let(:character_id) { 1 }
  let(:body)         { "Green is probably voiced by John DiMaggio." }
  let(:active)       { true }
end
