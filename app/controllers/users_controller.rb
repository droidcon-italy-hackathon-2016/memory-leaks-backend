class UsersController < ApplicationController
  def create
    user = User.create(user_params.merge(photo_url: photo_url, photo_urls: photo_urls))
    respond_with user
  end

  private

  def user_params
    params.permit(:name, :device_token)
  end

  def photo_url
    photo_urls.sample
  end

  def photo_urls
    if params[:device_token]
      elder_photos
    else
      young_photos
    end
  end

  def elder_photos
    [
      "https://d1hekt5vpuuw9b.cloudfront.net/assets/article/4c76fc5e018baa83a0d458a723c7c844_grandpa-rules-580x326_featuredImage.jpg"
    ]
  end

  def young_photos
    [
      "http://cdn.24.co.za/files/Cms/General/d/719/344d7a46196a492095bafdd67a55511b.jpg",
      "http://thumbs.dreamstime.com/thumblarge_472/4723613.jpg",
      "http://thumbs.dreamstime.com/x/obbligazioni-del-grandpa-con-teenager-9910145.jpg"
    ]
  end
end
