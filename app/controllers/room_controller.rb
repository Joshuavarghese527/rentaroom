class RoomController < ApplicationController
  before_action :set_room, expect: [:index, :new, :create]
  before_action :authenticate_user!, expect: [:show]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "Saved..."
    else 
      render :new, notice: "Something went wrong..."
    end
  end

  def show
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def amenities
  end

  def location
  end

  def update
    if @room.update(room_params)
      flash[:notice] = "Saved.."
    else
      flash[:notice] = "Something Went Wrong.."
    end
    redirect_back(fallback_location: request.referer) #brings you back to the current page

  end

  private 

    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate,
       :bed_room, :bath_room, :listing, :summary, :address, :is_tv, 
       :is_kitchen, :is_internet, :price, :active)
    end
end
