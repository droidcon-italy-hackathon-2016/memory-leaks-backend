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
      "http://caiapark.org.uk/wp-content/uploads/2014/01/olderlady.jpg",
      "http://i.huffpost.com/gen/1743744/images/o-OLDER-PERSON-UNHAPPY-facebook.jpg",
      "http://cattongrovebiglocal.co.uk/wp-content/uploads/2015/05/older-lady.jpg"
    ]
  end

  def young_photos
    [
      "http://blog.yonkausa.com/wp-content/uploads/2015/06/habits-happy-people.jpg",
      "http://www.careershifters.org/sites/default/files/styles/article_node/public/field/image/laugh_10_0.jpg?itok=s2vmB2r_"
    ]
  end
end
