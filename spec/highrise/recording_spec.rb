require File.dirname(__FILE__) + '/../spec_helper'

describe Highrise::Recording do

  before(:each) do
    @recording = Highrise::Recording.new
  end
  
  it "should be instance of Highrise::Base" do
    @recording.kind_of?(Highrise::Base).should be_true
  end


end
