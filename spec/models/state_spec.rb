require 'spec_helper'

describe State do
  it { should have_valid(:name).when('New York') }
  it { should_not have_valid(:name).when('', nil) }

  it { should have_many(:buildings).dependent(:nullify) }
end
