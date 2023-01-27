#!/bin/sh

while IFS= read -r line; do
	modname="${line%%[ ]*}"
	modprobe "$modname"
done < <(kmod static-nodes -f devname)

