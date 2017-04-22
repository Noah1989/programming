#! /bin/sh
s51 -v >&2 && { (echo dc 0 0; yes step) \
	| s51 -S out=/proc/self/fd/3 "$1" \
	| grep -oP '(0>)? \?? \K0x.*$' \
	| sed '2,${/^0x0000/q}' > trace.log \
	&& sort trace.log | uniq -c > trace.log;
} 3>&1

