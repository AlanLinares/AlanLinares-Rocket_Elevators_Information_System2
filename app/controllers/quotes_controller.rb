class QuotesController < ApplicationController

  # before_action :set_quote, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

#   # GET /quotes or /quotes.json
#   def index
#     @quotes = Quote.all
#   end

#   # GET /quotes/1 or /quotes/1.json
#   def show
#   end

#   # GET /quotes/new
#   def new
#     @quote = Quote.new
#   end

#   # GET /quotes/1/edit
#   def edit
#   end

#   # POST /quotes or /quotes.json
#   def create
#     @quote = Quote.new(quote_params)

#     respond_to do |format|
#       if @quote.save
#         format.html { redirect_to quote_url(@quote), notice: "Quote was successfully created." }
#         format.json { render :show, status: :created, location: @quote }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @quote.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /quotes/1 or /quotes/1.json
#   def update
#     respond_to do |format|
#       if @quote.update(quote_params)
#         format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
#         format.json { render :show, status: :ok, location: @quote }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @quote.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /quotes/1 or /quotes/1.json
#   def destroy
#     @quote.destroy

#     respond_to do |format|
#       format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_quote
#       @quote = Quote.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def quote_params
#       params.fetch(:quote, {})
#     end
# end

def create
  quote = Quote.create!(

    building_type: params[:building_type],
    number_of_apartments: params[:number_of_apartments], 
    number_of_floors: params[:number_of_floors],
    number_of_basements: params[:number_of_basements],
    number_of_companies: params[:number_of_companies],
    number_of_parking_spots: params[:number_of_parking_spots],
    number_of_elevators: params[:number_of_elevators],
    number_of_corporations: params[:number_of_corporations],  
    max_occupancy: params[:max_occupancy],
    business_hours: params[:business_hours],
    quality: params[:quality],
    elevator_amount: params[:elevator_amount],
    elevator_unit_price: params[:elevator_unit_price],
    elevator_total_price: params[:elevator_total_price],
    installation_fees: params[:installation_fees],
    final_price: params[:final_price],
  )
redirect_to('/quoteform')
end


end