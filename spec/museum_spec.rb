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
    let(:patron_1){Patron.new("Bob", 20)}
    let(:patron_2){Patron.new("Sally", 20)}
    let(:patron_3){Patron.new("Johnny", 5)}

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

  it "can reccomend exhibits to the patrons" do 
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("IMAX")

    expect(dmns.recommend_exhibits(patron_1)).to include(dead_sea_scrolls, gems_and_minerals)
    expect(dmns.recommend_exhibits(patron_2)).to include(imax)
    # Please note I chose to use include so that the order of the exhibits didn't matter. I could have used to eq if it did, but I wanted it to be more flexible as I'm not sure what's coming in Iteration 3. 
  end 

  it "the museum starts out without any patrons" do 
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    expect(dmns.patrons).to eq([])
  end 

  it "the museum can add patrons and interests" do 

    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("IMAX")
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    expect(dmns.patrons).to eq([patron_1, patron_2, patron_3])

  end 

  it "can list the patrons by their exhibit interest" do 
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    expect(dmns.patrons_by_exhibit_interest).to eq({
      gems_and_minerals => [patron_1], 
      dead_sea_scrolls => [patron_1, patron_2, patron_3], 
      imax => []

    })

  end 

  xit "determines the contestants for the lottery of dead sea scrolls" do 
    patron_1 = Patron.new("Bob", 0)
    patron_2 = Patron.new("Sally", 20)
    patron_3 = Patron.new("Johnny", 5)
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to eq([patron_1, patron_3])
  end 

  end
end 