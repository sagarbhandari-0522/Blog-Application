# frozen_string_literal: true

class ApplicationController < ActionCont
  def after_sign_in_path_for
    articles_path
  end
end
