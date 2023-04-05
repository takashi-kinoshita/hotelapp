module UsersHelper
        def user_icon_image_url(user)
          user.icon_image.attached? ? url_for(user.icon_image) : 'default_icon.png'
        end
end
