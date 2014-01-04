require 'spec_helper'

describe Building do
  let(:blanks) { ['', nil] }

  it { should have_valid(:street_address).when('25 My Way') }
  it { should_not have_valid(:street_address).when(*blanks) }

  it { should have_valid(:city).when('My City') }
  it { should_not have_valid(:city).when(*blanks) }

  it { should validate_numericality_of(:postal_code).only_integer }
  it { should ensure_length_of(:postal_code).is_at_least(5) }
  it { should_not have_valid(:postal_code).when(*blanks) }

  it { should belong_to(:state) }

  it { should belong_to(:owner) }
end
