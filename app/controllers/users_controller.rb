class UsersController < ApplicationController
  def create
    user = User.create(user_params.merge(photo_url: photo_url))
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
      "http://www.versusbattle.com/wp-content/uploads/2013/03/darth-vader.jpg",
    ]
  end

  def young_photos
    [
      "http://cdn.fansided.com/wp-content/blogs.dir/319/files/2015/04/Luke-NOOOOOO.gif"
    ]
  end
end
