require 'rails_helper'

describe "New author page", type: :feature do
  
  it "should render withour error" do
    visit new_author_path
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path
    
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should create an author when the form is submitted with valid values" do
    visit new_author_path
    
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'https://en.wikipedia.org/wiki/Alan_Turing'
    find('input[type="submit"]').click

    alan = Author.find_by!(:last_name => 'Turing')
    expect(alan).to_not be_nil
    expect(alan.first_name).to eq("Alan")
  end

  it "should show validation errors if they exist" do
    visit new_author_path
    
    # do not fill last_name field
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[homepage]', with: 'https://en.wikipedia.org/wiki/Alan_Turing'
    find('input[type="submit"]').click

    expect(page).to have_text /error/i
  end

end