require 'rails_helper'

# the tests are defined by expectations

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_length_of(:username).is_at_least(3).is_at_most(12) }

end
