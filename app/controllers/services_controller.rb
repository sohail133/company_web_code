class ServicesController < ApplicationController
  def show
    @service = Service.friendly.find(params[:id])
    @setting = Setting.where(status: 'active').take
    @services = Service.where(status: 'active')
  end
end