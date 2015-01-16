require 'rails_helper'

describe ShortUrl do

  let(:short_url) {ShortUrl.new}

  describe '#full' do
    it 'should accept a valid url' do
      short_url.full = 'http://github.com'
      expect(short_url).to be_valid
    end

    it 'should reject an invalid url' do
      short_url.full = 'http://a'
      expect(short_url).to_not be_valid
    end

    it 'should prepend http' do
      short_url.full = 'www.google.com'
      short_url.valid?
      expect(short_url.full).to eq('http://www.google.com')
    end

  end

  describe '#short' do
    it 'should be generated' do
      short_url.full = 'www.google.com'
      short_url.valid?
      expect(short_url.short).to_not be_nil
    end
  end

end