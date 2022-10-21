class ApplicationController < ActionController::Base
  include Bali::LayoutConcern

  default_form_builder Bali::FormBuilder
end
