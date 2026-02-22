# AC/DC Countdown

A simple Bash script that sends countdown notifications to Discord for upcoming AC/DC concert dates.

## Description

This script calculates the number of days remaining until designated AC/DC concert dates and posts automated countdown messages to a Discord channel via webhook. It features different message formats depending on the countdown status:

- **Multiple days remaining**: Displays the exact number of days left
- **1 day remaining**: Special message highlighting that the show is tomorrow
- **Show day**: Special message confirming that today is the concert day

## Requirements

- Bash
- `curl` command-line tool
- Discord webhook URL

## Usage

1. Set your Discord webhook URL as an environment variable:
   ```bash
   export discord_webhook_url="https://discord.com/api/webhooks/YOUR_WEBHOOK_ID/YOUR_WEBHOOK_TOKEN"
   ```

2. Run the script:
   ```bash
   ./acdc.sh
   ```

## Configuration

Edit the `dates` array in the script to add or modify concert dates:

```bash
dates=("2026-02-24 00:00:00" "2026-02-28 00:00:00" "2026-03-04 00:00:00")
```

Dates should be in the format: `YYYY-MM-DD HH:MM:SS`
