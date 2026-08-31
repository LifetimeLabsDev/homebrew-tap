cask "privacynotes" do
  version "0.491.2"
  sha256 "a9dcd30d9aa449703dbc0bbd0186054b8f7b9594702cc8ae65e4b4d009c14533"

  url "https://releases.privacynotes.app/#{version}/PrivacyNotes_#{version}_universal.dmg",
      verified: "releases.privacynotes.app/"
  name "PrivacyNotes"
  desc "End-to-end encrypted notes, tasks, and journal"
  homepage "https://privacynotes.app/"

  # The updater manifest the app itself polls, so the cask can never claim a
  # version the product does not serve.
  livecheck do
    url "https://releases.privacynotes.app/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # Tauri's updater handles its own upgrades in place.
  auto_updates true
  depends_on macos: :ventura

  app "PrivacyNotes.app"

  zap trash: [
    "~/Library/Application Support/app.privacynotes",
    "~/Library/Caches/app.privacynotes",
    "~/Library/HTTPStorages/app.privacynotes",
    "~/Library/Preferences/app.privacynotes.plist",
    "~/Library/Saved Application State/app.privacynotes.savedState",
    "~/Library/WebKit/app.privacynotes",
  ]
end
