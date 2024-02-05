require "rails_helper"

# Specs in this file have access to a helper object that includes
# the ProfilesHelper. For example:
#
# describe ProfilesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ProfilesHelper, type: :helper do
  describe "name" do
    it "returns display name if there is one" do
      profile = create(:profile, display_name: "display name")
      expect(name(profile)).to eq "display name"
    end

    it "returns username if no display name" do
      profile = create(:profile, username: "username", display_name: "")
      expect(name(profile)).to eq "username"
    end
  end
end
