class InspectionsController < ApplicationController

  def index
    @inspections = Inspection.all
    json_response(@inspections)
  end
end
