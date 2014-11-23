require 'spec_helper'

describe EventsController do
  render_views
  describe "index" do
    before do
      Event.create!(name: 'Super Bowl', year: 2015, location: "Glendale")
      Event.create!(name: 'Burning Man', year: 2015, location: "Black Rock City")
      Event.create!(name: 'NBA All-Star Game', year: 2015, location: "New York City")
      Event.create!(name: 'Summer Olympics', year: 2016, location: "Rio de Janeiro")

      xhr :get, :index, format: :json, keywords: keywords
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_name
      ->(object) { object["name"] }
    end

    context "when the search finds results" do
      let(:keywords) { 'super' }
      it 'should 200' do
        expect(response.status).to eq(200)
      end
      it 'should return one result' do
        expect(results.size).to eq(1)
      end
      it "should include 'Super Bowl'" do
        expect(results.map(&extract_name)).to include('Super Bowl')
      end
    end

    context "when the search doesn't find results" do
      let(:keywords) { 'foo' }
      it 'should return no results' do
        expect(results.size).to eq(0)
      end
    end
  end

  describe "show" do
    before do
      xhr :get, :show, format: :json, id: event_id
    end

    subject(:results) { JSON.parse(response.body) }

    context "when the event exists" do
      let(:event) {
        Event.create!(name: 'Super Bowl',
               year: 2015,
               location: "Glendale")
      }
      let(:event_id) { event.id }

      it { expect(response.status).to eq(200) }
      it { expect(results["id"]).to eq(event.id) }
      it { expect(results["name"]).to eq(event.name) }
      it { expect(results["year"]).to eq(event.year) }
      it { expect(results["location"]).to eq(event.location) }
    end

    context "when the event doesn't exit" do
      let(:event_id) { -9999 }
      it { expect(response.status).to eq(404) }
    end
  end

  describe "create" do
    before do
      xhr :post, :create, format: :json, event: { name: "Ultra",
                                                   year: 2015,
                                                   location: "Miami" }
    end
    it { expect(response.status).to eq(201) }
    it { expect(Event.last.name).to eq("Ultra") }
    it { expect(Event.last.year).to eq(2015) }
    it { expect(Event.last.location).to eq("Miami") }
  end

  describe "update" do
    let(:event) {
      Event.create!(name: 'Super Bowl',
                            year: 2015,
                            location: 'Glendale')
    }
    before do
      xhr :put, :update, format: :json, id: event.id, event: { name: 'Ultra',
                                                                 location: 'Miami' }
      event.reload
    end
    it { expect(response.status).to eq(204) }
    it { expect(event.name).to eq('Ultra') }
    it { expect(event.year).to eq(2015) }
    it { expect(event.location).to eq('Miami') }
  end

  describe "destroy" do
    let(:event_id) {
      Event.create!(name: 'Super Bowl',
                     year: 2015,
                     location: 'Glendale').id
    }
    before do
      xhr :delete, :destroy, format: :json, id: event_id
    end
    it { expect(response.status).to eq(204) }
    it { expect(Event.find_by_id(event_id)).to be_nil }
  end
end