require 'spec_helper'

describe Category do
  it { should validate_presence_of(:title) }

  it { should belong_to :category }
  it { should have_many :categories }
end
