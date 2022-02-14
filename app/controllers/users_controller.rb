class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    if params[:commit].present?
      if params[:nickname].present? && params[:nickname] != @user.nickname
        if User.find_by(nickname: params[:nickname]).nil?
          @user.nickname = params[:nickname]
          flash.notice = t "alert.nickname_changed"
        else
          flash.alert = t "alert.nickname_taken"
        end
      end

      if params[:email].present? && params[:email] != @user.email
        @user.email = params[:email]
        flash.notice = t "alert.email_changed"
      end
    end

    @user.save
  end
end
