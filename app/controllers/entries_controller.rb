class EntriesController < ApplicationController

  def new
  end

  def create
    @entry = Entry.new
    @entry.user_id = session["user_id"]
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry.uploaded_image.attach(params[:uploaded_image])
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
