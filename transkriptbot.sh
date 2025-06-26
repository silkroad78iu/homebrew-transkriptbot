#!/bin/bash
AUDIO_DIR="$HOME/Documents/Eingehende_Audios"
TRANSCRIPT_DIR="$HOME/Documents/Transkripte"
WHISPER_PATH="$(brew --prefix)/bin/main"
MODEL_DIR="$HOME/.whisper-models"
MODEL="$MODEL_DIR/ggml-large.bin"

mkdir -p "$AUDIO_DIR" "$TRANSCRIPT_DIR" "$MODEL_DIR"

[ -f "$MODEL" ] || curl -L -o "$MODEL" https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large.bin

for audio in "$AUDIO_DIR"/*.{wav,mp3,m4a}; do
  [ -f "$audio" ] || continue

  base=$(basename "$audio")
  name="${base%.*}"
  date=$(echo "$name" | grep -Eo '[0-9]{4}\.[0-9]{2}\.[0-9]{2}' || date +"%Y-%m-%d")
  subject=$(echo "$name" | grep -i 'meeting' || echo "Unbekannt")

  "$WHISPER_PATH" -m "$MODEL" -f "$audio" -of "$TRANSCRIPT_DIR/$name" --language de

  echo -e "Betreff: $subject\nDatum: $date\n\n$(cat "$TRANSCRIPT_DIR/$name.txt")" > "$TRANSCRIPT_DIR/$name.txt"

  echo "[OK] Transkribiert: $name.txt"
  rm "$audio"
done
