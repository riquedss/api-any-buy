# frozen_string_literal: true

class StoragesController < ApplicationController
  before_action { verify_authenticated('adm') }
  before_action :set_storage, only: %i[show destroy]

  def index
    @storages = Storage.all
    render(json: @storages)
  end

  def show
    render(json: @storage)
  end

  def destroy
    @storage.destroy
  end

  private

  def set_storage
    @storage = Storage.find(params[:id])
  end
end
