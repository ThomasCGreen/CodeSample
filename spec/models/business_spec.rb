require 'spec_helper'

describe Business do
  it { should validate_presence_of(:phone) }

  it { should belong_to :category }
end
