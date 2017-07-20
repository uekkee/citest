require 'rails_helper'

RSpec.describe User, type: :model do
  context 'sorting' do
    let(:size) { 1000 }
    let(:sorted) { [].tap { |a| size.times { |t| a << t } } }
    let(:shuffled) { sorted.shuffle }
    it { expect(sorted).to eq shuffled.sort }
  end

  context 'inserting' do
    let(:size) { 100 }
    before { create_list :user, size }
    it { expect(User.count).to eq size }
  end

  context 'redis' do
    require 'redis'

    let(:redis) { Redis.new }
    let(:key) { 'my-key' }
    let(:msg) { 'hello world' }
    before { redis.set(key, msg) }
    it { expect(redis.get(key)).to eq msg }
  end
end
