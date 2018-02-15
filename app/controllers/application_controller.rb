class ApplicationController < ActionController::API

  def seed_db
    Rails.application.load_seed
  end

end
