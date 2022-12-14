class UsersController < ApplicationController
  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:params_confirmation]
    )
    if user.save
      render json: { message: "Account created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end

  def update
    user = User.find_by(id: params[:id])
    user.first_name = params[:first_name] || user.first_name
    user.last_name = params[:last_name] || user.last_name
    user.email = params[:email] || user.email  
    user.save
    render json: user.as_json
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    render json: { message: "Account successfully deleted" }
  end

end
