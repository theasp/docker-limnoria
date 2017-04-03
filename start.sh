#!/bin/sh

NUM_CONF_FILES=$(find . -maxdepth 1 -name '*.conf' | wc -l)

if [ "$NUM_CONF_FILES" -eq 1 ]; then
    CONF_FILE=$(find . -maxdepth 1 -name '*.conf' | head -n 1)
    supybot "$CONF_FILE"
elif [ "$NUM_CONF_FILES" -gt 1 ]; then
    >&2 echo "Extra configuration files for Limnoria found. Please remove all but one."
else
    # Check if we have a stdin allocated to use for the wizard
    if [ ! -t 0 ] ; then
        >&2 echo "Warning: No TTY detected but we need to run the wizard. Try running this container with the -t flag."
        >&2 echo "Example: \"docker run -v ~/limnoria:/var/limnoria --rm -it limnoria\""
        >&2 echo ""
    fi

    supybot-wizard
fi
