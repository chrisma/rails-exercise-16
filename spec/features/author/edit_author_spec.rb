require 'rails_helper'

describe "Edit author page", type: :feature do
  
  it "should be routable" do
    @author = FactoryBot.create :author
    visit edit_author_path(@author)
  end
  
  it "should save changes" do
    @author = FactoryBot.create :author
    visit edit_author_path(@author)
    fill_in "author[first_name]", :with => 'Not Alan'
    find('input[type="submit"]').click
    expect(@author.reload.first_name).to eq('Not Alan')
  end

end