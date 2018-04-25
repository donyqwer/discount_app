class OffersController < ApplicationController
  before_action :set_offer, only: [:edit, :update, :claim, :show, :destroy]
  
  def index
    @offers = Offer.all
  end
  
  def new
    @offer = Offer.new
  end
  
  def show
  end
  
  def edit
  end
  
  def destroy
    @offer.destroy
    flash[:danger] = "Offer was successfully deleted"
    redirect_to offers_path
  end
  
  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      flash[:success] = "Offer was successfully created"
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end
  
  def update
    if @offer.update(offer_params)
      flash[:success] = "Offer was successfully updated"
      redirect_to offer_path(@offer)
    else
      render :edit
    end
  end
  
  def claim
    flash[:success] = "#{@offer.title} was successfully claimed"
    redirect_to root_path
  end
  
  private
  def set_offer
    @offer = Offer.find(params[:id])
  end
  
  def offer_params
    params.require(:offer).permit(:title, :description, :image)
  end
  
end
