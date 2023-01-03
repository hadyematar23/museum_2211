require 'rspec'
require './lib/exhibit'
require './lib/patron'

RSpec.describe Patron do
  context "happy paths" do 
  let(:exhibit){Exhibit.new({name: "Gems and Minerals", cost: 0})}
  let(:patron_1){Patron.new("Bob", 20)}

  it "exists as an object of Patron" do 

    expect(patron_1).to be_an_instance_of(Patron)

  end 

  it "has some attributes" do 

    expect(patron_1.name).to eq("Bob")
    expect(patron_1.spending_money).to eq(20)
  end 

  it "starts out with no interests" do 

    expect(patron_1.interests).to eq([])

  end 

  it "adds some interests" do 

    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])

  end 


  end 
end 