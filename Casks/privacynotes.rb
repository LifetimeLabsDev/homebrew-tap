cask "privacynotes" do
  version "0.305.5"
  sha256 "bbf1e3803e96472a45d838dc86768c0e62429c6b1e6d3e5823dcc538d9b91ffa"

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
