require 'rails_helper'

RSpec.describe ShortUrlsController, type: :controller do
  describe '#redirect_me' do
    it "should redirect" do
      su = ShortUrl.new(full: "www.google.com")
      su.save

      get :redirect_me, short: su.short

      expect(response).to redirect_to("http://www.google.com")
    end
  end
end