#!/bin/bash

PING_HOST="onedrive.live.com"
RUSTIC_BIN="/var/home/jumpyvi/.nix-profile/bin/rustic"
LOG_FILE="$HOME/.cache/rustic-backup/backup.log"
mkdir -p "$(dirname "$LOG_FILE")"

TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"
NOTIFY_TITLE="📦 Rustic Backup"
LOG_LINE=""

# Check if OneDrive is reachable
if ! ping -c 1 -W 2 "$PING_HOST" >/dev/null 2>&1; then
    LOG_LINE="FAILED [$TIMESTAMP] OneDrive unreachable"
    notify-send -u critical "$NOTIFY_TITLE" "🛑 Skipped: $PING_HOST unreachable"
    MAIL_BODY="$LOG_LINE"
    echo "$MAIL_BODY" | mail -s "$MAIL_SUBJECT" "$MAIL_TO"
    echo "$LOG_LINE" >> "$LOG_FILE"
    tail -n 5 "$LOG_FILE" > "$LOG_FILE.tmp" && mv "$LOG_FILE.tmp" "$LOG_FILE"
    exit 0
fi

# Run the backup
if "$RUSTIC_BIN" backup $HOME/Documents $HOME/Games/Minecraft $HOME/Downloads $HOME/OneDrive --git-ignore --glob-file "$HOME/.config/rustic/bkp-glob.txt" &&
   "$RUSTIC_BIN" forget --keep-hourly 3 --keep-daily 7 --keep-weekly 3 --keep-monthly 0 --keep-yearly 0 --prune; then
    LOG_LINE="[$TIMESTAMP] Backup completed successfully"
    notify-send -u low "$NOTIFY_TITLE" "✅ Backup completed"
else
    LOG_LINE="FAILED [$TIMESTAMP] Backup error"
    notify-send -u critical "$NOTIFY_TITLE" "🛑 Backup failed"
fi

# Save and trim log
echo "$LOG_LINE" >> "$LOG_FILE"
tail -n 5 "$LOG_FILE" > "$LOG_FILE.tmp" && mv "$LOG_FILE.tmp" "$LOG_FILE"
