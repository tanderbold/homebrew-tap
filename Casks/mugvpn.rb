cask "mugvpn" do
  version "0.2.2"
  sha256 "89a8c765c5fbf9696a8a027699aa857c40261187b0ae0ff8ef38d1d5a7bbfaa5"

  url "https://github.com/tanderbold/MugVPN/releases/download/v#{version}/MugVPN-#{version}.dmg"
  name "MugVPN"
  desc "Menu-bar OpenVPN client that keeps several connections up at once"
  homepage "https://github.com/tanderbold/MugVPN"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "MugVPN.app"

  # The app registers a privileged helper (SMAppService daemon); its own
  # uninstaller (About MugVPN > Uninstall MugVPN…, or `MugVPN --uninstall`)
  # removes the helper and the system part under /Library.
  uninstall launchctl: "com.mugvpn.helper"

  zap trash: [
    "~/Library/Application Support/MugVPN",
    "~/Library/Logs/MugVPN",
    "~/Library/Preferences/com.mugvpn.app.plist",
    "~/Library/Saved Application State/com.mugvpn.app.savedState",
  ]
end
