#!/bin/sh
# Screenshot helper for Sway.
# Original script by Witalij Berdinskich.
# Forked by: FelipeFMA for https://github.com/FelipeFMA/nekrodots-sway
# I modified it to copy screenshots by default and improved the notifications for better appearance.

# Check if the WAYLAND_DISPLAY environment variable is set
# This ensures that Wayland is running, as this script is for Wayland-based environments
if [ -z $WAYLAND_DISPLAY ]; then
    (>&2 echo Wayland is not running)  # Print error message if Wayland is not running
    exit 1  # Exit the script with an error code
fi

## Define the folder to store screenshots
# It uses the PICTURES directory defined by the user's environment settings and appends '/Screenshots'
SCREENSHOT_DIR=$(xdg-user-dir PICTURES)/Screenshots

# Create the 'Screenshots' directory if it doesn't already exist
mkdir -p "$SCREENSHOT_DIR"

# Generate a timestamp for the screenshot file name
# The timestamp format can be customized using the SWAYSHOT_DATEFMT environment variable (default format used here)
SCREENSHOT_TIMESTAMP=$(date "+${SWAYSHOT_DATEFMT:-%F_%H-%M-%S_%N}")
# Full path for the screenshot file
SCREENSHOT_FULLNAME="$SCREENSHOT_DIR"/screenshot_${SCREENSHOT_TIMESTAMP}.png

# Filter for grabbing the focused window or region from Sway's tree structure
readonly filter='recurse(.nodes[], .floating_nodes[]) | select(.focused and .pid).rect | "\(.x),\(.y) \(.width)x\(.height)"'

# Function to make the screenshot based on the selected option (display, window, region)
make_screenshot() {
    case "$1" in
        -h|--help)  # Show help message if the user asks for it
            echo 'Usage: swayshot [display|window|region]'
            return 0  # Exit the function
            ;;
        region)  # Take a screenshot of a user-defined region
            grim -g "$(slurp -b '#AFAFAFAF' -c '#FF3F3FAF' -s '#00000000' -w 3 -d)" "$2"
            ;;
        window)  # Take a screenshot of the focused window
            grim -g "$(swaymsg --type get_tree --raw | jq --raw-output "${filter}")" "$2"
            ;;
        *)  # Default case: capture the whole focused output/display
            grim -o "$(swaymsg --type get_outputs --raw | jq --raw-output '.[] | select(.focused) | .name')" "$2"
            ;;
    esac
}

# Function to copy the screenshot to the clipboard
copy_to_clipboard() {
    # Check for available clipboard tools and use the one found
    if type wl-copy >/dev/null  2>&1; then
        wl-copy < "$1"  # Use wl-copy if available (Wayland clipboard tool)
    elif type xsel >/dev/null  2>&1; then
        xsel --clipboard < "$1"  # Use xsel if available (X11 clipboard tool)
    elif type xclip &>/dev/null; then
        xclip -selection clipboard < "$1"  # Use xclip if available (another X11 clipboard tool)
    else
        # If no clipboard tool is found, just print the file content (as fallback)
        echo "$1"
    fi
}

# Function to show a notification about the screenshot action
show_message() {
    if type notify-send >/dev/null  2>&1; then
        # Show a notification with a title and clear message
        notify-send --expire-time=3000 --category=screenshot --icon="$1" "Screenshot Copied to Clipboard" "Feel free to paste it." -i "$1"
    fi
}

# Function to upload the screenshot to a public image hosting service (0x0.st)
upload_screenshot() {
    if [ -f "$1" ]; then
        # Try to upload the image to 0x0.st
        UPLOAD_LINK=$(curl -s -F "file=@\"$1\"" https://0x0.st)
        if [ ! -z "$UPLOAD_LINK" ]; then
            # If the upload is successful, copy the link to the clipboard and show a notification
            echo "$UPLOAD_LINK" | wl-copy  # Copy the upload link to the clipboard
            notify-send --expire-time=3000 --category=screenshot --icon="document-send" "Screenshot Upload Successful" "The link to your screenshot has been copied to clipboard!"
            return 0  # Return success
        else
            echo "Upload failed."  # Print an error message if upload fails
            return 1  # Return failure
        fi
    fi
}

# Call the make_screenshot function with the first argument (e.g., display, window, region)
make_screenshot "$1" "$SCREENSHOT_FULLNAME"

# Check if the screenshot file was created successfully
if [ ! -f "$SCREENSHOT_FULLNAME" ]; then
    exit;  # Exit if the screenshot was not created
fi

# Process the second argument (upload or clipboard)
case "$2" in
    upload)  # If 'upload' is chosen, attempt to upload the screenshot
        upload_screenshot "$SCREENSHOT_FULLNAME"
        ;;
    *)  # Otherwise, copy the screenshot to the clipboard and show a notification
        copy_to_clipboard "$SCREENSHOT_FULLNAME"
        show_message "$SCREENSHOT_FULLNAME" document-save "Screenshot image"
        ;;
esac
