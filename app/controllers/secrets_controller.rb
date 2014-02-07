class SecretsController < ApplicationController

  def new
  end

  def create
    @secret = current_user.authored_secrets.new(params[:secret])
    @secret.tag_ids = params[:secret][:tag_ids]

    if @secret.save
      render partial: "secrets/secret", locals: {secret: @secret}
    else
      flash.now[:error] = @secret.errors.full_messages
      render :new
    end
  end

end