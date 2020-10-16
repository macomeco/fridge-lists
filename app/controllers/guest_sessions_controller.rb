class GuestSessionsController < ApplicationController
    def create
        user = User.find_by(email: 'guestlogin@example.com')
    end

end
