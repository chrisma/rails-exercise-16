require 'rails_helper'

describe "Show author page", type: :feature do
  
  it "should be working in conjunction with the author factory" do
    @author = FactoryBot.create :author
  end

  it "should be routable" do
    @author = FactoryBot.create :author
    visit author_path(@author)
  end

  it "should display details" do
    @author = FactoryBot.create :author
    visit author_path(@author)

    expect(page).to have_text(@author.first_name)
    expect(page).to have_text(@author.last_name)
    expect(page).to have_text(@author.homepage)
  end
end