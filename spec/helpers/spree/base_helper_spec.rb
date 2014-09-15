require 'spec_helper'

describe Spree::BaseHelper do
  context '#navigator_item' do
    let!(:menu_item) { create(:menu_item) }

    it 'should build navigation item' do
      expect(helper.navigator_item(menu_item)).to(
        have_link(menu_item.name, href: menu_item.url)
      )
    end
  end
end
