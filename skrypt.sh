#!/bin/bash

# Function to display the current date
display_date() {
    date
}

# Function to create log files
create_logs() {
    num_files=${1:-100}
    for i in $(seq 1 $num_files); do
        echo -e "log$i.txt\n$0\n$(date)" > log$i.txt
    done
}

# Function to display help information
display_help() {
    echo "Available options:"
    echo "--date: Display today's date"
    echo "--logs [num]: Generate log files"
    echo "--help: Display help information"
}

# Main script logic
case "$1" in
    --date)
        display_date
        ;;
    --logs)
        create_logs "$2"
        ;;
    --help)
        display_help
        ;;
    *)
        echo "Invalid option. Use --help to see the available options."
        ;;
esac
