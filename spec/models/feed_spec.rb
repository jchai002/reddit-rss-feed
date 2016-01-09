require 'rails_helper'

RSpec.describe Feed, type: :model do

  context 'validations' do
    it { should validate_presence_of(:query) }
    context 'uniqueness' do
      it { should validate_uniqueness_of(:query) }
    end
  end

end
