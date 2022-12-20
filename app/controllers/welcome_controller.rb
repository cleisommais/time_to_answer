class WelcomeController < ApplicationController
  http_basic_authenticate_with name: 'cleison', password: '123@456', except: :index
  def index; end
end
