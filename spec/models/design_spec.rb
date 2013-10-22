require 'spec_helper'

describe Design do
  it { should validate_presence_of :description }
  it { should validate_presence_of :title }

  it { should belong_to :user }
end
