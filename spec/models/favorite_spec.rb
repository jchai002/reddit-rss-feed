require 'rails_helper'

RSpec.describe Favorite, type: :model do

  context 'validations' do
    it { should validate_presence_of(:link) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:date) }
    context 'uniqueness' do
      it { should validate_uniqueness_of(:link) }
    end
  end

end
