# WoW Realm Status Notifier (Gehennas - Classic MoP EU)

This is a Bash script that checks the status of the **Gehennas** realm on **World of Warcraft: Classic MoP (EU)** using Blizzard's official API.

When the realm goes **UP**, the script prints the status and plays a Windows notification sound.

## Features

- Authenticates using Blizzard's OAuth2 API.
- Polls the Gehennas realm status using the WoW Game Data API.
- Alerts you with a system sound when the realm is available.

## Requirements

- Windows 11 with:
  - Git Bash or WSL
  - PowerShell (built-in)
  - `jq` (for parsing JSON)
- A Blizzard developer account with:
  - **Client ID**
  - **Client Secret**

## Setup

1. **Clone the repository** or download the script.

2. **Install `jq`** (if not already installed):
   - Download from: https://stedolan.github.io/jq/download/
   - Or install via [Scoop](https://scoop.sh):
     ```
     scoop install jq
     ```

3. **Set your Blizzard API credentials** in the script:
   ```bash
   CLIENT_ID="your_client_id_here"
   CLIENT_SECRET="your_client_secret_here"
