#!/usr/bin/env bash
# Helper script to get your approximate location for wlsunset

echo "Getting your approximate location for wlsunset configuration..."

# Try to get location from IP (requires internet)
if command -v curl >/dev/null; then
    LOCATION=$(curl -s https://ipapi.co/json/ 2>/dev/null)
    if [[ -n "$LOCATION" ]]; then
        LAT=$(echo "$LOCATION" | grep -oE '"latitude":[^,]*' | cut -d':' -f2)
        LON=$(echo "$LOCATION" | grep -oE '"longitude":[^,]*' | cut -d':' -f2)
        CITY=$(echo "$LOCATION" | grep -oE '"city":"[^"]*' | cut -d':' -f2 | tr -d '"')
        REGION=$(echo "$LOCATION" | grep -oE '"region":"[^"]*' | cut -d':' -f2 | tr -d '"')
        
        if [[ -n "$LAT" && -n "$LON" ]]; then
            echo "Location found: $CITY, $REGION"
            echo "Latitude: $LAT"
            echo "Longitude: $LON"
            echo ""
            echo "To use automatic sunrise/sunset with wlsunset, replace the exec line in your sway config with:"
            echo "exec wlsunset -l $LAT -L $LON"
            echo ""
            echo "Current temperature-based config:"
            echo "exec wlsunset -t 3500 -T 6500"
        else
            echo "Could not determine coordinates."
        fi
    else
        echo "Could not get location data."
    fi
else
    echo "curl not available. Install curl for automatic location detection."
fi

echo ""
echo "Manual configuration options:"
echo "For temperature-based (current): wlsunset -t 3500 -T 6500"
echo "For time-based: wlsunset -S 07:00 -s 19:00"
echo "For location-based: wlsunset -l LATITUDE -L LONGITUDE"
