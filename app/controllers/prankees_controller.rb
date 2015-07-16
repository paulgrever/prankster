class PrankeesController < ApplicationController
  def create
    prankee = Prankee.new(prankee_params)
    if prankee.save
      redirect_to root_path
    else
      render :back
    end
  end

  private

  def prankee_params
    params.require(:prankee).permit(:first_name, :last_name, :phone_number)
  end
end
