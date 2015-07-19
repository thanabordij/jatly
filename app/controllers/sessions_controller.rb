class SessionsController < Devise::SessionsController
  # clear_respond_to
  respond_to :json
  # after_filter :something
  # def something
  #   binding.pry
  # end
end