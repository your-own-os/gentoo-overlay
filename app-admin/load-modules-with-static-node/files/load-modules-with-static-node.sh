#!/bin/sh

while IFS= read -r line; do
	modname="${line%%[ ]*}"
	modprobe "$modname"
done < <(/bin/kmod static-nodes -f devname)

