class Api::V1::BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find_by(id: params[:id])
  end

  def create
    @band = Band.create(name: params[:name], email: params[:email], number_members: params[:number_members])
    
    if @band.save
    render :show
    else
      render json: { errors: @band.errors.full_messages }, status: 422
    end
  end

  def update
    band_id = params[:id]
    @band = Band.find_by(id: band_id)
    @band.update(name: params[:name], email: params[:email], number_members: params[:number_members])

    render :show
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    @band.destroy

    render nothing: true
  end



end
