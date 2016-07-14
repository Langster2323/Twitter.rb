class UsersController < ApplicationController
  def index
    render template: 'users/index.html.erb', locals: { user: User.all }
  end

  def show
    binding.pry
    if User.exists?(params[:id])
    render template: 'users/show.html.erb', locals: { user: User.find(params[:id]) }
    else
      render html: "Not found" status: 404
    end
  end

  def update
    user = User.find(params[:id])
    user.fullname = params[:user][:fullname] if params[:user][:fullname].present?
    user.email = params[:user][:email] if params[:user][:email].present?
    user.handle = params[:user][:handle] if params[:user][:handle].present?
    if user.save
      redirect_to_user_path(user)
    else
      render template: '/users/new.html.erb', locals: {
        user: user
      }
    end
  end

  def create

  end

  def edit
  end

  def destroy
  end
end
