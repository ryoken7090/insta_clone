module StoriesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name =='create' || action_name =='confirm'
      confirm_stories_path
    else
      story_path
    end
  end
end
