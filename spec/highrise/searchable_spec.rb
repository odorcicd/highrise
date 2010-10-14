require File.dirname(__FILE__) + '/../spec_helper'

describe Highrise::Searchable do
  before(:each) do
    @john_doe = Highrise::Person.new(:id => 1, :first_name => "John", :last_name => "Doe")
  end
  describe ".search" do
    it "should find_all_across_pages with search.xml" do
      Highrise::Person.should_receive(:find_all_across_pages).with(:from => "/people/search.xml", :params => {"criteria[email]" => "john.doe@example.com", "criteria[zip]" => "90210"})
      Highrise::Person.search(:email => "john.doe@example.com", :zip => "90210")
    end
  end
end
