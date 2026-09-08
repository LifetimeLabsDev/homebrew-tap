# Homebrew tap for PrivacyNotes

PrivacyNotes is in the official Homebrew cask repository, so this tap is no longer needed:

```bash
brew install privacynotes
```

`tap_migrations.json` points the `privacynotes` token at `homebrew/cask`, so an install
made from this tap moves across on the next `brew update` with nothing to do by hand.

You can drop the tap once that has happened:

```bash
brew untap lifetimelabsdev/tap
```

https://formulae.brew.sh/cask/privacynotes
