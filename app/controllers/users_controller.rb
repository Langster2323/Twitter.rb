class UsersController < ApplicationController
  def index
    render template: 'user/index.html.erb', locals: { user: User.all }
  end

  def new
    render locals: {
      user: User.new
    }
  end

  def edit
    render locals: {
      user: User.find(params[:id])
    }
  end

  def show
    binding.pry
    if User.exists?(params[:id])
      render template: 'user/show.html.erb', locals: { user: User.find(params[:id]) }
    else
      render html: "Not found", status: 404
    end
  end



  def create
    user = User.new
    user.fullname = params[:user][:fullname]
    if user.save
      redirect_to_user_path(user)
    else
      flash[:alert] = "Could not be saved due to errors"
      render template: 'user/new.html.erb', locals: {
        user: user
      }

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
      render template: '/user/new.html.erb', locals: {
        user: user
      }
    end
  end
end
