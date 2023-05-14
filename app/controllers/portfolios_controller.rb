class PortfoliosController < ApplicationController
  def show
    @portfolio = Portfolio.friendly.find(params[:id])
    @setting = Setting.where(status: 'active').take
    @services = Service.where(status: 'active')
  end
end