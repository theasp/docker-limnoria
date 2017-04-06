#!/bin/sh

# Runs the existing configuration.
# Runs the wizard if there are no configurations.
# Bails if there are multiple configurations.

NUM_CONF_FILES=$(find . -maxdepth 1 -name '*.conf' | wc -l)

if [ "$NUM_CONF_FILES" -eq 1 ]; then
    CONF_FILE=$(find . -maxdepth 1 -name '*.conf' | head -n 1)
    echo "Using configuration file: $CONF_FILE"
    echo ""

    exec supybot "$CONF_FILE" "$@"
elif [ "$NUM_CONF_FILES" -gt 1 ]; then
    >&2 echo "Multiple configuration files (*.conf) for Limnoria found. Remove the extra configurations and try again."

    exit 1
else
    # Warn if no stdin detected to use for the wizard
    if [ ! -t 0 ]; then
        >&2 echo "Warning: No TTY detected but we need to run the wizard. Try running this container with the -t flag."
        >&2 echo "Example: \"docker run -v ~/limnoria:/data --rm -it limnoria\""
        >&2 echo ""
    fi

    echo "No configuation found. Running wizard..."
    echo ""

    supybot-wizard
fi
