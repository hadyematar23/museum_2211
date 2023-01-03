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

  end
end 