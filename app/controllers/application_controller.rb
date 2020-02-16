class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def not_found
      raise ActionController::RoutingError.new('Not Found')
    rescue
      render_404
    end

    def render_404
      render file: "#{Rails.root}/public/404", status: :not_found
    end

  include Pundit

    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    private

    def skip_pundit?
      devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    end


end
