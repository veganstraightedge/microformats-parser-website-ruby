require 'rails_helper'

RSpec.describe MicroformatsController do
  describe 'GET #show' do
    it 'returns http redirect' do
      get :show
      expect(response).to redirect_to :root
    end
  end
end
