require 'spec_helper'

describe M3TableAdmin::Table do

  before do
    @table = M3TableAdmin::Table.new("vehicles")
  end


  it "Model should equal initial value" do
    expect(@table.model).to eq "vehicles"
  end

  it "Singularized value" do
    expect(@table.singularized).to eq "vehicle"
  end

  it "should return route" do

  end

end
