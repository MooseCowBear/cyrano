module ProfilesHelper
  def name(profile)
    profile.display_name || profile.username
  end
end
