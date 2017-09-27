#!/bin/bash
root_dir='/var/lib/mailtrain'

sa-learn --no-sync --spam "$root_dir/spam" && find "$root_dir/spam" -mindepth 1 -delete
sa-learn --no-sync --ham "$root_dir/ham" && find "$root_dir/ham" -mindepth 1 -delete
sa-learn --sync
