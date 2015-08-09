class TemplatesController < ApplicationController
  layout false
  
  def show
    render file: Rails.root.join("app/assets/javascripts/angular/templates/#{params[:filename]}")
  end
end