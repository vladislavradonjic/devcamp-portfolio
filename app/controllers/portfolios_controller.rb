class PortfoliosController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout 'portfolio'

  access all: [:show, :index, :anuglar], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

	def index
		@portfolio_items = Portfolio.by_position
	end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render body: nil
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

	def new
		@portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
	end

	def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  	@portfolio_item = Portfolio.find(params[:id])

  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  	@portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
  	# lookup
  	@portfolio_item = Portfolio.find(params[:id])
  	# delete
  	@portfolio_item.destroy
  	#redirect
  	respond_to do |f|
  		f.html { redirect_to portfolios_url, notice: "Record was removed." }
  	end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body,
                                      :position, 
                                      technologies_attributes: [:name]
                                     )
  end

end
