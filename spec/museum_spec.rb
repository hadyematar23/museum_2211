require 'rspec'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
  context "happy paths" do 
    let(:dmns){Museum.new("Denver Museum of Nature and Science")}
    let(:gems_and_minerals){Exhibit.new({name: "Gems and Minerals", cost: 0})}
    let(:dead_sea_scrolls){Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
    let(:imax){Exhibit.new({name: "IMAX",cost: 15})}

  it "exhists as an object of museum" do 
    expect(dmns).to be_an_instance_of(Museum)

  end 

  it "has a name and other attributes" do 
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
    expect(dmns.exhibits).to eq([])

  end 

  it "the exhibits are object of Exhibit" do 
    expect(gems_and_minerals).to be_an_instance_of(Exhibit)
    expect(dead_sea_scrolls).to be_an_instance_of(Exhibit)
    expect(imax).to be_an_instance_of(Exhibit)

  end 

  it "the exhibits get added to the museum" do 

    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])

  end
end 