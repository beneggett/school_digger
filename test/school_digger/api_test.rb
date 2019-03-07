require "test_helper"

class SchoolDigger::ApiTest < Minitest::Test

  describe 'API methods' do

    describe '#autocomplete' do
      it "Returns an autocomplete suggestion" do
        VCR.use_cassette('autocomplete returns', match_requests_on: [:query]) do
          response = SchoolDigger::Api.new.autocomplete('San Die', st: "CA")
          assert response
          assert_includes response["schoolMatches"].first["schoolName"], "San Diego"
        end
      end
    end

    describe '#districts' do
      it "Returns a list of districts by state CA" do
        VCR.use_cassette('districts by state CA', match_requests_on: [:query]) do
          response = SchoolDigger::Api.new.districts('CA')
          assert response.success?
          assert_equal "CA", response.dig("districtList").sample.dig("address", "state")
        end
      end
    end

    describe '#district' do
      it "Returns a single districts by ID 0600001" do
        VCR.use_cassette('districts by id 0600001', match_requests_on: [:query]) do
          response = SchoolDigger::Api.new.district("0600001")
          assert response.success?
          assert_equal "0600001", response.dig("districtID")
        end
      end
    end

    describe '#district_rankings' do
      it "Returns a list of district_rankings by state CA" do
        VCR.use_cassette('district_rankings by state CA', match_requests_on: [:query]) do
          response = SchoolDigger::Api.new.district_rankings('CA')
          assert response.success?
          assert_equal 50, response.dig("numberOfDistricts")
        end
      end
    end


    describe '#schools' do
      it "Returns a list of schools by state CA" do
        VCR.use_cassette('schools by state CA', match_requests_on: [:query]) do
          response = SchoolDigger::Api.new.schools('CA')
          assert response.success?
          assert_equal "CA", response.dig("schoolList").sample.dig("address", "state")
        end
      end
    end

    describe '#school' do
      it "Returns a single schools by ID 490003601072" do
        VCR.use_cassette('schools by id 490003601072', match_requests_on: [:query]) do
          response = SchoolDigger::Api.new.school("490003601072")
          assert response.success?
          assert_equal "490003601072", response.dig("schoolid")
        end
      end
    end

    describe '#school_rankings' do
      it "Returns a list of school_rankings by state CA" do
        VCR.use_cassette('school_rankings by state CA', match_requests_on: [:query]) do
          response = SchoolDigger::Api.new.school_rankings('CA')
          assert response.success?
          assert_equal 5709, response.dig("numberOfSchools")
        end
      end
    end

    describe '#next_page' do
      it "finds the next page for any api call" do
        VCR.use_cassette('next page on schools by state CA', match_requests_on: [:query]) do
          original_response = SchoolDigger::Api.new.schools('CA')
          assert original_response.success?
          next_page_response = SchoolDigger::Api.new.next_page(original_response)
          refute_equal original_response.dig("schoolList").first["schoolid"], next_page_response.dig("schoolList").first["schoolid"]
        end
      end
    end


  end

end
