class ManagersController < ApplicationController
  layout "managers"

  include RoomsHelper
  include ManagersHelper

  def correct_manager
    return if current_user&.manager?

    flash[:warning] = t "managers.warning.not_correct"
    redirect_to business_home_path
  end

  def load_room
    @room = Room.find_by id: params[:id]
    return @image = @room.images if @room.present?

    flash[:warning] = t "managers.warning.show_room", id: params[:id]
    redirect_to managers_rooms_path
  end
end
