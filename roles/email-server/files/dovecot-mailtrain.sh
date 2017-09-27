#!/bin/bash
set -e -o pipefail
root_dir='/var/lib/mailtrain'

# Determine which are the right and wrong directories
if [ "$1" = 'ham' ]; then
        add='ham'
        remove='spam'
else
        add='spam'
        remove='ham'
fi

# Generate a unique ID for the message while saving to tmp
trap '[ -e "${root_dir}/tmp/$$" ] && rm -f "${root_dir}/tmp/$$" 2>/dev/null' \
                INT HUP TERM EXIT
sha=$(tee "${root_dir}/tmp/$$" | shasum -a 256 | awk '{print $1}')

# Remove file if it already exists in the wrong folder
[[ -e "${root_dir}/${remove}/${sha}" ]] && rm -f "${root_dir}/${remove}/${sha}"

# Move tmp file into correct folder
mv -f "${root_dir}/tmp/$$" "${root_dir}/${add}/${sha}"
exit 0
