````markdown
# WoW Realm Status Notifier (Gehennas - Classic MoP EU)

This is a Bash script that checks the status of the **Gehennas** realm on **World of Warcraft: Classic MoP (EU)** using Blizzard's official API.

When the realm status is **UP**, the script prints the status and plays a Windows notification sound.

---

## ✨ Features

- Authenticates with Blizzard's OAuth2 API.
- Queries the WoW Game Data API for a specific realm's status.
- Loops until the realm status becomes `UP`.
- Plays a system **ping sound** when the realm is up.

---

## ✅ Requirements

- Windows 11 with:
  - Git Bash, WSL, or compatible Bash shell
  - PowerShell (comes preinstalled)
  - [`jq`](https://stedolan.github.io/jq/) (for parsing JSON)
- Blizzard Developer Account:
  - [Create one here](https://develop.battle.net/access/)
  - Get your **Client ID** and **Client Secret**

---

## ⚙️ Setup

1. **Clone the repository** or copy the script.

2. **Install `jq`** if you don't already have it:

   - With [Scoop](https://scoop.sh):
     ```
     scoop install jq
     ```

   - Or download manually from: https://stedolan.github.io/jq/download/

3. **Edit the script** to insert your Blizzard API credentials:

````

CLIENT\_ID="your\_client\_id\_here"
CLIENT\_SECRET="your\_client\_secret\_here"

```

4. **(Optional) Customize your region, realm, namespace, or locale**:

Inside the script, modify these values:

```

REGION="eu"
REALM\_SLUG="gehennas"
NAMESPACE="dynamic-classic-eu"
LOCALE="en\_GB"

```

You can replace these values to check the status of any WoW realm:
- `REALM_SLUG`: your realm name in lowercase with no spaces
- `NAMESPACE`: depending on the version (e.g., `dynamic-classic`, `dynamic-classic-mop-eu`, etc.)
- `REGION`: `eu`, `us`, `kr`, or `tw`
- `LOCALE`: `en_GB`, `en_US`, etc.

See the [Blizzard API Docs](https://develop.battle.net/documentation/world-of-warcraft/game-data-apis) for valid options.

5. **Make the script executable**:

```

chmod +x check-gehennas.sh

```

6. **Run the script**:

```

./check-gehennas.sh

```

---

## 🔔 Sound Notification

When the realm status becomes `UP`, the script plays a **Windows ping sound** using PowerShell.

You can customize the sound file by editing this line in the script:

```

powershell.exe -c "(New-Object Media.SoundPlayer 'C:\Windows\Media\Windows Notify System Generic.wav').PlaySync();"

```

Replace it with any `.wav` file on your PC if desired.

---

## 📝 Notes

- The script checks every few seconds in a loop.
- When the realm is available, it prints `"UP"` multiple times and plays a sound.
- You can change the realm and region to monitor **any realm** supported by Blizzard.

---

