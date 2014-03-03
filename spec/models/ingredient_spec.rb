require 'spec_helper'

describe Ingredient do 
  it { should have_many(:restaurants)}
end