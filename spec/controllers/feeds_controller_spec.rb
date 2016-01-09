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

  end

  describe 'PUT #update' do
    it 'updates the attributes of a feed' do
      @feed = Feed.create({query:"not in factory"})
      new_attrs = valid_feed_attrs
      put :update, id: @feed.id, feed: new_attrs
      @feed.reload
      attrs = {query: @feed.query}
      expect(attrs).to eq(new_attrs)
    end

    it 'does not update feed with invalid params' do
      @feed = Feed.create({query:"not in factory"})
      old_attrs = @feed.attributes
      new_attrs = invalid_feed_attrs
      put :update, id: @feed.id, feed: new_attrs
      @feed.reload
      expect(@feed.attributes).to eq(old_attrs)
    end

  end

  # describe 'DELETE #destroy' do
  #   it 'reduces menu item count by 1' do
  #     create_menu_item
  #     expect{delete :destroy, cafe_id: @cafe.id, id: @menu_item.id}.to change{@cafe.menu_items.count}.by(-1)
  #   end
  #   it 'redirects to cafe#profile after destruction' do
  #     create_menu_item
  #     delete :destroy, cafe_id: @cafe.id, id: @menu_item.id
  #     expect(response).to redirect_to(cafes_profile_path)
  #   end
  #   it 'does not allow destruction when logged out' do
  #     @cafe = FactoryGirl.create(:cafe)
  #     @menu_item = @cafe.menu_items.new
  #     @menu_item.update_attributes(menu_item_attrs)
  #     expect{delete :destroy, cafe_id: @cafe.id, id: @menu_item.id}.to change{@cafe.menu_items.count}.by(0)
  #   end
  #   it 'does not allow destruction when unauthorized' do
  #     @cafe1 = FactoryGirl.create(:cafe)
  #     @cafe2 = FactoryGirl.create(:cafe)
  #     log_in_cafe(@cafe1)
  #     @menu_item = @cafe2.menu_items.new
  #     @menu_item.update_attributes(menu_item_attrs)
  #     expect{delete :destroy, cafe_id: @cafe2.id, id: @menu_item.id}.to change{@cafe1.menu_items.count}.by(0)
  #   end
  # end

end
