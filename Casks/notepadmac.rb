cask "notepadmac" do
  version "0.3.1"
  sha256 "fc48a5d0df5066eb983312d73cac23de09819ec359dc763035dc77335b5f2428"

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
