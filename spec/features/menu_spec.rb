require 'spec_helper'

feature 'Menu' do
  let(:root_path) { spree.root_path }

  context 'no menu items available' do
    before { visit root_path }

    xit 'default item listed' do
    end

    xit 'cart appenss at the end of the menu' do
    end
  end

  context 'menu items available' do
    before { visit root_path }

    xit 'builds menu items' do
    end

    xit 'cart appenss at the end of the menu' do
    end
  end
end
