require 'rails_helper'

RSpec.describe FeedsController, type: :controller do

  def valid_feed_attrs
    FactoryGirl.attributes_for(:feed)
  end

  def invalid_feed_attrs
    FactoryGirl.attributes_for(:invalid_feed)
  end

  def create_feed
    FactoryGirl.create(:feed)
  end

  describe 'POST #create' do
    it 'Valid attributes adds a new feed' do
      expect{post :create, feed: valid_feed_attrs }.to change{Feed.all.count}.by(1)
    end

    it 'does not add an invalid feed' do
      expect{post :create, feed: invalid_feed_attrs }.to change{Feed.all.count}.by(0)
    end

    it 'redirects to feed index after adding feed' do
      post :create, feed: valid_feed_attrs
      expect(response).to redirect_to(feeds_path)
    end

    it 'creates unique feeds' do
      @feed=create_feed

      expect{post :create, feed: @feed.attributes }.to change{Feed.all.count}.by(0)
    end

  end

  describe 'PUT #update' do
    it 'updates the attributes of a feed' do
      @feed = create_feed
      new_attrs = valid_feed_attrs
      put :update, id: @feed.id, feed: new_attrs
      @feed.reload
      attrs = {query: @feed.query}
      expect(attrs).to eq(new_attrs)
    end

    it 'does not update feed with invalid params' do
      @feed = create_feed
      old_query = @feed.query
      put :update, id: @feed.id, feed: invalid_feed_attrs
      @feed.reload
      expect(@feed.query).to eq(old_query)
    end

    it 'redirects to feeds index after update' do
      @feed = create_feed
      put :update, feed: valid_feed_attrs, id: @feed.id
      expect(response).to redirect_to(feeds_path)
    end

  end

  describe 'DELETE #destroy' do
    it 'reduces feeds count by 1' do
      @feed = create_feed
      expect{delete :destroy, id: @feed.id}.to change{Feed.all.count}.by(-1)
    end
  end

end
