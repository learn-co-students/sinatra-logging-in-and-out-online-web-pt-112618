require 'pry'
class Helpers

  def self.current_user(session)
    user = User.find_by_id(session[:user_id])
    user
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
    #should return true if the user_id is in the session hash and false if not
  end
end
