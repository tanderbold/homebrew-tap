cask "notepadmac" do
  version "0.3.0"
  sha256 "9a3051af7b27c511d109cc1b35397e088f38d39ed9cb36d9118ce94e4cab9c23"

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
