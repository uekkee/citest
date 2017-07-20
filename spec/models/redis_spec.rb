require 'rails_helper'
require 'redis'

RSpec.describe Redis, type: :model do
  context 'redis' do
    let(:redis) { Redis.new }
    let(:key) { 'my-key' }
    let(:msg) { 'hello world' }
    before { redis.set(key, msg) }
    it { expect(redis.get(key)).to eq msg }
  end
end
