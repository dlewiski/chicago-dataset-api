class FacilitiesController < ApplicationController

  before_action :restrict_access

  # before_action :authenticate, except: [ :index ]

  def index
    @facilities = Facility.all
    json_response(@facilities)
  end

  def show
    @facility = Facility.find(params[:id])
    json_response(@facility)
  end

  def create
    @quote = Quote.create(quote_params)
    json_response(@quote)
  end

  def update
    @quote = Quote.find(params[:id])
    @quote.update(facility_params)
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
  end

  private
  def facility_params
    params.permit(:dba_name, :aka_name)
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

  # def authenticate
  #   authenticate_or_request_with_http_token do |token, options|
  #     # Compare the tokens in a time-constant manner, to mitigate
  #     # timing attacks.
  #     ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
  #   end
  # end
  # def restrict_access
  #   api_key = ApiKey.find_by_access_token(params[:access_token])
  #   head :unauthorized unless api_key
  # end
end
