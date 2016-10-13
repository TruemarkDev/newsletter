# frozen_string_literal: true
class ManagersController < ApplicationController
  before_action :authenticate_manager!

  def index
    @managers = Manager.page(params[:page]).all.order(id: :desc)
  end

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(create_manager_params)
    if @manager.save
      redirect_to managers_path
    else
      render :new
    end
  end

  def edit
    @manager = Manager.find(params[:id])
  end

  def update
    @manager = Manager.find(params[:id])

    params = update_manager_params
    params.delete(:password) if params[:password].blank?

    if @manager.update(params)
      redirect_to managers_path
    else
      render :edit
    end
  end

  def destroy
    @manager = Manager.find(params[:id])
    @manager.destroy
    redirect_to managers_path
  end

private

  def create_manager_params
    params.require(:manager).permit(:email, :password)
  end

  def update_manager_params
    params.require(:manager).permit(:email, :password)
  end
end
