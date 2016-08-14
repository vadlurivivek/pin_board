class PinsController < ApplicationController
	def index
		@pins = Pin.all.order("created_at DESC")
	end

	def new
		@pin = current_user.pins.build
	end

	def create
		@pin = current_user.pins.build(pin_params)
		if @pin.save
			redirect_to @pin, notice: "Successfully created new Pin"
		
		else
			render 'new'
		end
	end

	def show
		@pin = Pin.find(params[:id])
	end

	def edit ##this will need a template where as update doesnt just think update works on background like php file which updates
		@pin = Pin.find(params[:id])
	end

	def update
		@pin = Pin.find(params[:id])
		if @pin.update_attributes(pin_params)
			redirect_to @pin, notice:"pin was Successfully updated"
		else
			render 'edit'## render always looks for methods not pages it can also look for pages
		end
	end
	def destroy
		@pin = Pin.find(params[:id])
		@pin.destroy
		redirect_to root_path
	end

	private
		def pin_params
			params.require(:pin).permit(:title,:description,:image)
		end

end
