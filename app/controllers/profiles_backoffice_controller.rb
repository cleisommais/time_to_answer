class ProfilesBackofficeController < ApplicationController
    layout 'profiles'
    before_action :authenticate_profile!
end
