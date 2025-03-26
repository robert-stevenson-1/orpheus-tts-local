#!/bin/bash

# Default voice value
VOICE="tara"
TEXT=""
TEXT_FILE=""

# Function to display help
function display_help() {
    echo "Usage: $0 [options] \"Your text here\" OR $0 [options] -f textfile.txt"
    echo "Options:"
    echo "  -v, --voice VOICE     Select voice (tara, leah, jess, leo, dan, mia, zac, zoe). Default: tara"
    echo "  -f, --file FILE       Use text from file instead of command line"
    echo "  -h, --help            Display this help message"
    echo ""
    echo "Example:"
    echo "  $0 \"Hello world\""
    echo "  $0 -v leo \"Hello world\""
    echo "  $0 --voice zoe -f my_text.txt"
    exit 0
}

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    display_help
fi

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -v|--voice)
            VOICE="$2"
            # Validate voice
            if [[ ! "$VOICE" =~ ^(tara|leah|jess|leo|dan|mia|zac|zoe)$ ]]; then
                echo "Error: Invalid voice. Must be one of: tara, leah, jess, leo, dan, mia, zac, zoe"
                exit 1
            fi
            shift 2
            ;;
        -f|--file)
            TEXT_FILE="$2"
            # Check if file exists
            if [ ! -f "$TEXT_FILE" ]; then
                echo "Error: File '$TEXT_FILE' not found."
                exit 1
            fi
            shift 2
            ;;
        -h|--help)
            display_help
            ;;
        *)
            # If not an option, consider it as text
            if [ -z "$TEXT" ]; then
                TEXT="$1"
            else
                # If text already set, display error
                echo "Error: Both text and additional arguments provided."
                echo "Use quotes around your text or use -f for file input."
                display_help
            fi
            shift
            ;;
    esac
done

# Validate inputs
if [ -n "$TEXT_FILE" ] && [ -n "$TEXT" ]; then
    echo "Error: Both direct text and text file provided. Please choose only one."
    display_help
fi

if [ -z "$TEXT_FILE" ] && [ -z "$TEXT" ]; then
    echo "Error: No text or text file provided."
    display_help
fi

# Process the text from file if specified
if [ -n "$TEXT_FILE" ]; then
    # Read file content into TEXT
    TEXT=$(cat "$TEXT_FILE")
    
    # Check if file was empty
    if [ -z "$TEXT" ]; then
        echo "Error: Text file is empty."
        exit 1
    fi
fi

# Execute the Python script with the appropriate parameters
echo "Running with voice: $VOICE"
source venv/bin/activate
python gguf_orpheus.py --text "$TEXT" --voice "$VOICE"