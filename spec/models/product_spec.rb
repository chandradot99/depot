require "rails_helper"

describe Product do   
  context 'validation specs' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:image_url) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
    it { should validate_uniqueness_of(:title) } 
  end
end