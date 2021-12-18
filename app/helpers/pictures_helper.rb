module PicturesHelper

  def choose_new_edit
    if action_name == 'new'
      confirm_pictures_path
    elsif action_name == 'edit'
      picture_path
    end
  end

end
