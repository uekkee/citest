require 'rails_helper'

RSpec.describe User, type: :model do
  context 'sorting' do
    let(:size) { 10000000 }
    let(:sorted) { [].tap { |a| size.times { |t| a << t } } }
    let(:shuffled) { sorted.shuffle }
    it { expect(sorted).to eq shuffled.sort }
  end

  context 'inserting' do
    let(:size) { 1000000 }
    before { create_list :user, size }
    it { expect(User.count).to eq size }
  end
end
