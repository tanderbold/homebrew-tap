cask "notepadmac" do
  version "0.1.0"
  sha256 "bf08fbdce5ce5be994c807ca4f97913bf8ef5976cde9374fd9b1cb034a680943"

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
