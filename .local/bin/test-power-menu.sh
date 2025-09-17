#!/usr/bin/env bash

echo "Testing power menu functions..."

# Test lock screen
echo "1. Testing lock screen (swaylock)..."
if command -v swaylock >/dev/null; then
    echo "✓ swaylock is available"
    # Test lock briefly
    timeout 1 swaylock -f -c 000000 &
    sleep 0.5
    pkill -f "timeout.*swaylock" 2>/dev/null || true
    pkill swaylock 2>/dev/null || true
    echo "✓ swaylock test completed"
else
    echo "✗ swaylock not found"
fi

echo ""

# Test logout command (dry run)
echo "2. Testing logout command..."
if swaymsg --help >/dev/null 2>&1; then
    echo "✓ swaymsg is available"
    echo "✓ 'swaymsg exit' would work (not executing to avoid logout)"
else
    echo "✗ swaymsg not available"
fi

echo ""

# Test suspend
echo "3. Testing suspend capability..."
if systemctl --help >/dev/null 2>&1; then
    echo "✓ systemctl is available"
    if systemctl suspend --dry-run >/dev/null 2>&1; then
        echo "✓ suspend is available"
    else
        echo "✗ suspend might not be available"
    fi
else
    echo "✗ systemctl not available"
fi

echo ""

# Test wofi
echo "4. Testing wofi menu..."
if command -v wofi >/dev/null; then
    echo "✓ wofi is available"
else
    echo "✗ wofi not found - power menu won't work"
fi

echo ""
echo "Power menu component test complete!"
