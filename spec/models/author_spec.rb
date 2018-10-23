require 'rails_helper'

describe "Author model", type: :model do
  it "should have name and homepage" do
    alan = Author.new(
        first_name: 'Alan',
        last_name: 'Turing',
        homepage: 'http://wikipedia.org/Alan_Turing')
    
    expect(alan.first_name).to eq('Alan')
    expect(alan.last_name).to eq('Turing')
    expect(alan.homepage).to eq('http://wikipedia.org/Alan_Turing')
  end

  it "returns the full name" do
    alan = Author.new(
        first_name: 'Alan',
        last_name: 'Turing',
        homepage: 'http://wikipedia.org/Alan_Turing')
    
    expect(alan.name).to eq('Alan Turing')
  end

  it "is only valid with a last name" do
    alan = Author.new(
        first_name: 'Alan',
        homepage: 'http://wikipedia.org/Alan_Turing')
    
    expect(alan).to_not be_valid
  end

  it "is not valid with an empty last name" do
    alan = Author.new(
        first_name: 'Alan',
        last_name: '',
        homepage: 'http://wikipedia.org/Alan_Turing')
    
    expect(alan).to_not be_valid
  end
end
