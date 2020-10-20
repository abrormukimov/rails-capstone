class ImagesController < ApplicationController
  def remove
    @image = ActiveStorage::Attachment.find(current_user.image.attachment.id)
    @image.purge
    redirect_back(fallback_location: request.referer)
  end
end
