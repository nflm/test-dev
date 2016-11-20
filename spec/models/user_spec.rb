require 'rails_helper'

describe User do
  it { is_expected.to validate_uniqueness_of(:nickname) }
  it { is_expected.to validate_uniqueness_of(:email) }
end