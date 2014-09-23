require 'spec_helper'

describe Spree::Admin::MenuItemsController do
  stub_authorization!

  let!(:menu_item) { create(:menu_item) }

  let(:index_path) { spree.admin_menu_items_path }

  let(:valid_item)   { { name: Faker::Lorem.word } }
  let(:invalid_item) { { name: '' } }

  context '#index' do
    it 'loads `index` template' do
      spree_get :index
      expect(response).to render_template(:index)
    end
  end

  context '#new' do
    it 'loads `new` template' do
      spree_get :new
      expect(response).to render_template(:new)
    end
  end

  context '#create' do
    context 'fails with invalid values' do
      it 'then renders `new` template' do
        spree_post :create, menu_item: invalid_item
        expect(response).to render_template(:new)
      end
    end

    it 'creates menu item' do
      spree_post :create, menu_item: valid_item
      expect(flash[:success]).to eq(
        Spree.t('navigator.admin.flash.success.create', name: valid_item[:name])
      )
      expect(response).to redirect_to(index_path)
    end
  end

  context '#edit' do
    it 'loads `edit` template' do
      spree_get :edit, id: menu_item.id
      expect(response).to render_template(:edit)
    end
  end

  context '#update' do
    context 'fails with invalid values' do
      it 'then renders `edit` template' do
        spree_post :update, id: menu_item.id, menu_item: invalid_item
        expect(response).to render_template(:edit)
      end
    end

    it 'updates menu item' do
      spree_post :update, id: menu_item.id, menu_item: valid_item
      expect(flash[:success]).to eq(
        Spree.t('navigator.admin.flash.success.update', name: valid_item[:name])
      )
      expect(response).to redirect_to(index_path)
    end
  end

  context '#destroy' do
    it 'deletes item' do
      spree_post :destroy, id: menu_item.id
      expect(flash[:success]).to(
        eq Spree.t('navigator.admin.flash.success.destroy')
      )
      expect(response).to redirect_to(index_path)
    end
  end

  context '#children' do
    xit 'loads children JSON' do
      spree_get :index, id: menu_item.id, format: :json
      expect(response).to render_template(:children)
    end
  end
end
