require 'rspec'
require './lib/exhibit'
# require './lib/patron'

RSpec.describe Exhibit do
  context "happy paths" do 
  let(:exhibit){Exhibit.new({name: "Gems and Minerals", cost: 0})}

  it "exists as an object of the class Exhibit" do 
    expect(exhibit).to be_an_instance_of(Exhibit)
  end

  it "has a name and cost" do 
    expect(exhibit.name).to eq("Gems and Minerals")
    expect(exhibit.cost).to eq(0)

  end 
  end
end 
