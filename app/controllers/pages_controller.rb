# frozen_string_literal: true

# A controller to handle static pages served from backend
class PagesController < ApplicationController
  def blank
    head :ok, content_type: 'text/html'
  end
end
