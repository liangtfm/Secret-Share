class SecretsController < ApplicationController

  def new
  end

  def create
    @secret = current_user.authored_secrets.new(params[:secret])

    if @secret.save
      head :ok
    else
      flash.now[:error] = @secret.errors.full_messages
      render :new
    end
  end

end