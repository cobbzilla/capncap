#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

URL=${CAPNCAP_URL:?no URL provided}
OUTFILE=${CAPNCAP_OUTFILE:?no outfile provided}
LOAD_WAIT=${CAPNCAP_LOAD_WAIT:-5}
SAVE_WAIT=${CAPNCAP_SAVE_WAIT:-5}

DISPLAY_NUMBER=1
export DISPLAY=:${DISPLAY_NUMBER}

# Start X server on Display 1
Xvfb ${DISPLAY} -screen ${DISPLAY_NUMBER} 1024x768x24 &

# Start window manager
openbox &

# Wait for window manager to init
sleep 2

mkdir -p "$(dirname "${OUTFILE}")"

cd "${SCRIPT_DIR}" && ./save_page_as.sh "${URL}" -d "${OUTFILE}" \
  -b firefox \
  --load-wait-time "${LOAD_WAIT}" \
  --save-wait-time "${SAVE_WAIT}"

echo "Saved ${URL} to $(basename "${OUTFILE}")"
