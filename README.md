# 🔐 shaSignatureCheck.sh – SHA256 File Integrity Checker (Linux Bash Script)

This Bash script allows you to verify the integrity of a file by calculating its **SHA256 hash** and comparing it with a user-provided reference hash.

## 📦 Features

- Accepts a file path from the user
- Calculates the file's SHA256 hash
- Asks for a custom SHA256 hash to compare against
- Outputs **PASS** in green if the hashes match
- Outputs **FAIL** in red if the hashes do not match

## ⚙️ Requirements

- A Linux terminal with Bash
- `sha256sum` installed (available by default on most distributions)

## 🛠️ Usage

### 1. Make the script executable

```bash
chmod +x shaSignatureCheck.sh
```

### 2. Run the script

```bash
./shaSignatureCheck.sh
```

### 3. Provide Inputs

- Full file path, for example:

  ```
  /home/youruser/Downloads/example.pdf
  ```

- SHA256 hash to verify, for example:

  ```
  d2d2d0efbdccd03a693a80101c3fd50bbca541b7fae0e70...
  ```

## 🖥 Example Output

```bash
File path: /home/user/Downloads/Document.pdf
Enter your reference SHA256 hash: e3b0c44298fc1c149afbf4c8996fb924...

PASS - Hashes match.
```

or

```bash
FAIL - Hashes do NOT match.
```

## 📁 Script Content (`shaSignatureCheck.sh`)

```bash
#!/bin/bash

GRUEN='\033[0;32m'
ROT='\033[0;31m'
NC='\033[0m'

read -p "Path to the file: " dateipfad

if [[ ! -f "$dateipfad" ]]; then
  echo -e "${ROT}Error: File not found.${NC}"
  exit 1
fi

datei_sha=$(sha256sum "$dateipfad" | awk '{ print $1 }')

read -p "Own SHA256-Signature to check: " benutzer_sha

if [[ "$datei_sha" == "$benutzer_sha" ]]; then
  echo -e "${GRUEN}PASS - Singature are the same.${NC}"
else
  echo -e "${ROT}FAIL - Signaturen are'nt the same.${NC}"
fi
```

## 💡 Optional: Global Usage

To make the script globally accessible from anywhere:

```bash
mkdir -p ~/bin
cp shaSignatureCheck.sh ~/bin/checksha
chmod +x ~/bin/checksha
```

Then simply run:

```bash
checksha
```

## 📝 License

This script is licensed under the MIT License. Use it freely at your own risk.
