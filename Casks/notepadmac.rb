cask "notepadmac" do
  version "0.2.0"
  sha256 "aaeac02b2ccf4053cfd63d3396f59a3036d4027eedba5000242c2cb6c0352920"

  url "https://github.com/tanderbold/NotepadMac/releases/download/v#{version}/NotepadMac-#{version}.dmg"
  name "NotepadMac"
  desc "Native port of the Notepad++ text editor"
  homepage "https://github.com/tanderbold/NotepadMac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "NotepadMac.app"

  zap trash: [
    "~/Library/Application Support/NotepadMac",
    "~/Library/Preferences/org.notepad-plus-plus.mac.plist",
    "~/Library/Saved Application State/org.notepad-plus-plus.mac.savedState",
  ]
end
