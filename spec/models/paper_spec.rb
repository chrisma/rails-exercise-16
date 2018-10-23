require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "is not valid with string as year" do
    paper = Paper.new(
        title: 'Title',
        venue: 'Venue',
        year: 'nineteen-twelve')
    
    expect(paper).to_not be_valid
  end
end
