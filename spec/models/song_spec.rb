require 'spec_helper'

describe Song do

  before :each do
    @song = FactoryGirl.create(:song)
  end

  it 'should calculate durability according to a special formula' do
    @song.durability_in_time.should == '02:55'
    @song.durability = 3604
    @song.durability_in_time.should == '01:00:04'
  end

end
