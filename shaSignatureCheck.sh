#!/bin/bash

# Colors
GRUEN='\033[0;32m'
ROT='\033[0;31m'
NC='\033[0m'

# Path to file
read -p "Path to the file: " dateipfad

# check if the file exists
if [[ ! -f "$dateipfad" ]]; then
  echo -e "${ROT}Error: File not found.${NC}"
  exit 1
fi

# get the SHA256 from the file
datei_sha=$(sha256sum "$dateipfad" | awk '{ print $1 }')

# require hash
read -p "Own SHA256-Signature to check: " benutzer_sha

# Check bot values
if [[ "$datei_sha" == "$benutzer_sha" ]]; then
  echo -e "${GRUEN}PASS - Singature are the same.${NC}"
else
  echo -e "${ROT}FAIL - Signaturen are'nt the same.${NC}"
fi
