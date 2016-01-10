require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do

  def valid_favorite_attrs
    FactoryGirl.attributes_for(:favorite)
  end

  def invalid_favorite_attrs
    FactoryGirl.attributes_for(:invalid_favorite)
  end

  def create_favorite
    FactoryGirl.create(:favorite)
  end

  describe 'POST #create' do
    it 'Valid attributes adds a new favorite' do
      expect{post :create, favorite: valid_favorite_attrs }.to change{Favorite.all.count}.by(1)
    end

    it 'does not add an invalid favorite' do
      expect{post :create, favorite: invalid_favorite_attrs }.to change{Favorite.all.count}.by(0)
    end

    it 'creates unique favorites' do
      @favorite=create_favorite
      expect{post :create, favorite: @favorite.attributes }.to change{Favorite.all.count}.by(0)
    end

  end


  describe 'DELETE #destroy' do
    it 'reduces favorites count by 1' do
      @favorite = create_favorite
      expect{delete :destroy, id: @favorite.id}.to change{Favorite.all.count}.by(-1)
    end
  end

end
