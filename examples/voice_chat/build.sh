#!/usr/bin/env bash
# Build voice_chat for esp_vocat_board_v1_2.
# Uses IDF v5.5.2 + idf-component-manager==2.4.9 (required — v2.4.2 shipped
# in the container mishandles the dependencies.lock from v2.4.9 builds).
# NOTE: rm -rf build/ before running this if switching from a different IDF
# container version — stale CMakeCache bakes in toolchain paths.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

podman run --rm \
  -v "$HOME/src/esp-agents-firmware:/project" \
  -w /project/examples/voice_chat \
  docker.io/espressif/idf:v5.5.2 \
  bash -c "pip install 'idf-component-manager==2.4.9' -q && idf.py build"
