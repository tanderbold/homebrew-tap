cask "notepadmac" do
  version "0.4.0"
  sha256 "90f672c21af1f1dabdc8166396fcd6e400c707ed3a95e5942bcc804e2f70482f"

  url "https://github.com/tanderbold/NotepadMac/releases/download/v#{version}/NotepadMac-#{version}.dmg"
  name "NotepadMac"
  desc "Native port of the Notepad++ text editor"
  homepage "https://github.com/tanderbold/NotepadMac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "NotepadMac.app"

  zap trash: [
    "~/Library/Application Support/NotepadMac",
    "~/Library/Preferences/io.github.tanderbold.notepadmac.plist",
    # up to 0.3.1 the port lived under the Notepad++ project's domain
    "~/Library/Preferences/org.notepad-plus-plus.mac.plist",
    "~/Library/Saved Application State/io.github.tanderbold.notepadmac.savedState",
    "~/Library/Saved Application State/org.notepad-plus-plus.mac.savedState",
  ]
end
