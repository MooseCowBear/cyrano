module ProfilesHelper
  def name(profile)
    if profile.display_name
      profile.display_name
    else
      profile.username
    end
  end
end
