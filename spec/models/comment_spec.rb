require 'spec_helper'

describe Comment do
  it { should have_valid(:body).when('Nice design.') }
  it { should_not have_valid(:body).when(nil, '') }

  it { should belong_to(:design) }
end
