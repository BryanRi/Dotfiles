#!/bin/awk -f
#

# Get servers from a mirrorlist by country/continent
#
# Usage for artix mirrorlist: $0 -v country="Europe" /etc/pacman.d/mirrorlist
#
# Usage for arch mirrorlist: $0 -v country="Netherlands" /etc/pacman.d/mirrorlist-arch

{ 
    if (NF == 0) {
        found = "False"
    }
    else if ($0 == "## " country) {
        found = "True"
    }
    else if (found == "True" && $1 != "#") {
        # Explicitly write 'Server =' in case the line is commented out.
        print "Server = " $3
    }
}
