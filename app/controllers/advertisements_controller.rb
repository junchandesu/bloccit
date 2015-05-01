class AdvertisementsController < ApplicationController
  def index
 	@ads = Advertisement.all
  end

  def show
   @ad = Advertisement.find(params[:id])
   @image = @ad.copy
  end
end

