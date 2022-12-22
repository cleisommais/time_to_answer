class UsersBackofficeController < ApplicationController
    layout 'users'
    before_action :authenticate_user!
end
