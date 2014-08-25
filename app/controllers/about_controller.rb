class AboutController < ApplicationController
  skip_before_filter :ensure_current_user

  def show
  end
end
