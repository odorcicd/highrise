require File.dirname(__FILE__) + '/../spec_helper'

describe Highrise::Party do
  
  it "should delegate to find(:all, :from => '/parties/recently_viewed.xml') when recently_viewed is called" do
    Highrise::Party.should_receive(:find).with(:all, {:from => '/parties/recently_viewed.xml'})
    Highrise::Party.recently_viewed
  end
end
