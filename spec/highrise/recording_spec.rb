require File.dirname(__FILE__) + '/../spec_helper'

describe Highrise::Recording do

  before(:each) do
    @recording = Highrise::Recording.new
  end
  
  it "should be instance of Highrise::Base" do
    @recording.kind_of?(Highrise::Base).should be_true
  end

  describe ".find_all_across_pages_since" do

    it "should delegate to find_all_across_pages with correct params" do
      time = Time.parse("Wed Jan 14 15:43:11 -0200 2009")
      Highrise::Recording.should_receive(:find_all_across_pages).with({:params=>{:since=>"20090114174311"}}).and_return("result")
      Highrise::Recording.find_all_across_pages_since(time).should == "result"
    end

  end

end
