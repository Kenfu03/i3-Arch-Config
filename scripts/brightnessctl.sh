    #!/bin/bash

    # Get current brightness percentage
    CURRENT_BRIGHTNESS=$(brightnessctl g)
    MAX_BRIGHTNESS=$(brightnessctl m)
    PERCENTAGE=$((100 * CURRENT_BRIGHTNESS / MAX_BRIGHTNESS))

    echo "$PERCENTAGE%"