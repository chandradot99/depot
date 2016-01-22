require 'spec_helper'

Rspec.describe Product, type: :model do
  context 'Validation Specs' do
    it {should_not have_fields(:image,:description,:image_url) }
  end
end