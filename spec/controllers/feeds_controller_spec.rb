require 'rails_helper'

RSpec.describe FeedsController, type: :controller do

  def valid_feed_attrs
    FactoryGirl.attributes_for(:feed)
  end

  def invalid_feed_attrs
    FactoryGirl.attributes_for(:invalid_feed)
  end

  describe 'POST #create' do
    it 'Valid attributes adds a new feed' do
      expect{post :create, feed: valid_feed_attrs }.to change{Feed.all.count}.by(1)
    end

    it 'does not add an invalid feed' do
      expect{post :create, feed: invalid_feed_attrs }.to change{Feed.all.count}.by(0)
    end

    it 'redirects to feed index after adding valid feed' do
      post :create, feed: valid_feed_attrs
      expect(response).to redirect_to(feeds_path)
    end

  end

end
