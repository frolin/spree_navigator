require 'spec_helper'

describe Spree::MenuItem do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
  end
end
