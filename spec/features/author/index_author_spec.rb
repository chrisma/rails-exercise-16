require 'rails_helper'

describe "Index author page", type: :feature do
  it "should be routable" do
    visit authors_path
  end

  it "should contain a table" do
    visit authors_path
    expect(page).to have_css 'table'
  end

  it "should have name and homepage columns" do
    visit authors_path
    expect(page).to have_css "th", text: /name/i
    expect(page).to have_css "th", text: /homepage/i
  end
  
  it "should list name and homepage of all authors" do
    @author = FactoryBot.create :author
    @author2 = FactoryBot.create :author, first_name: 'Edsger', last_name: 'Dijkstra', homepage: 'https://en.wikipedia.org/wiki/Edsger_W._Dijkstra'
    
    visit authors_path
    [@author, @author2].each do |author|
      #never eat yellow snow
      expect(page).to have_text author.name
      expect(page).to have_text author.homepage
    end
  end
  
  it "should link to the new author page" do
    visit authors_path
    # pass nil as link text: any text will match
    expect(page).to have_link nil, href: new_author_path
  end
  
  it "should contain links to interact with individual authors" do
    @author = FactoryBot.create :author
    @author2 = FactoryBot.create :author, first_name: 'Edsger', last_name: 'Dijkstra', homepage: 'https://en.wikipedia.org/wiki/Edsger_W._Dijkstra'
    
    visit authors_path
    [@author, @author2].each do |author|
      expect(page).to have_link nil, href: author_path(author)
      expect(page).to have_link nil, href: edit_author_path(author)
      expect(page).to have_link nil, href: author_path(author), text: 'Delete'
    end
  end

  it "should delete an author if the delete link is clicked" do
    @author = FactoryBot.create :author
    visit authors_path
    expect(page).to have_css("a[data-method='delete'][href='#{author_path(@author)}']")
    find("a[data-method='delete'][href='#{author_path(@author)}']").click
    expect { @author.reload }.to raise_error ActiveRecord::RecordNotFound
  end

end