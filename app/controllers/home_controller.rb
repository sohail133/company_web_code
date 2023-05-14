class HomeController < ApplicationController
	def index 
    @about = About.where(status: 'active').take
		@categories = Category.all
		@technologies = Technology.where(status: 'active')
		@services = Service.where(status: 'active')
		@portfolios = Portfolio.where(status: 'active')
		@reviews = ClientReview.where(status: 'active')
		@teams = Team.where(status: 'active')
    @setting = Setting.where(status: 'active').take
		@contacts = Contact.all
		@contact = Contact.new
	end
end