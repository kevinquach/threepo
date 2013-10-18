require 'spec_helper'
# Use Carrierwave's provided test matchers
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  let(:uploader) do
    ImageUploader.new(FactoryGirl.build(:design),
      :image)
  end

  let(:path) do
    Rails.root.join('spec/support/sample.jpg')
  end

  before do
    ImageUploader.enable_processing = true
  end

  after do
    ImageUploader.enable_processing = false
  end

  it 'stores without error' do
    expect(lambda { uploader.store!(File.open(path)) }).to_not raise_error
  end
end
