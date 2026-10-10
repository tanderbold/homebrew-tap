cask "mugvpn" do
  version "0.2.4"
  sha256 "7059f976927500752891d2997ef350001da3ed0e5ebba07632fec27b14d269d0"

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

  # The app registers a privileged helper (SMAppService daemon). Its own uninstaller
  # (About MugVPN > Uninstall MugVPN…, or `MugVPN --uninstall`) removes everything; here the
  # helper and its files go, profiles stay (as when the app is dragged to the Trash).
  uninstall launchctl: "com.mugvpn.helper",
            delete:    [
              "/Library/Application Support/MugVPN/libexec",
              "/Library/Application Support/MugVPN/locks.json",
              "/Library/Application Support/MugVPN/run",
              "/Library/LaunchDaemons/com.mugvpn.helper.plist",
              "/Library/Logs/MugVPN",
            ]

  zap delete: "/Library/Application Support/MugVPN",
      trash:  [
        "~/Library/Application Support/MugVPN",
        "~/Library/Logs/MugVPN",
        "~/Library/Preferences/com.mugvpn.app.plist",
        "~/Library/Saved Application State/com.mugvpn.app.savedState",
      ]
end
