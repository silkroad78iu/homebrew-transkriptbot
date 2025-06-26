# transkriptbot

Automatisierte lokale Transkription von Audio-E-Mail-Anhängen mit `whisper.cpp`.

## Installation

```bash
brew tap silkroad78iu/transkriptbot
brew install --HEAD transkriptbot
```

## Konfiguration

- `.getmailrc` – IMAP-Zugangsdaten eintragen
- `.procmailrc` – bleibt meist unverändert
- `transkriptbot.sh` – verarbeitet automatisch alle Audios im Zielordner

## Nutzung

```bash
getmail && transkriptbot.sh
```

Das Transkript wird gespeichert unter `~/Documents/Transkripte` mit Datum und Betreff.
