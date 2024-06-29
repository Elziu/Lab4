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

# Function to create error files
create_errors() {
    num_files=${1:-100}
    mkdir -p errorx
    for i in $(seq 1 $num_files); do
        echo -e "error$i.txt\n$0\n$(date)" > errorx/error$i.txt
    done
}

# Function to clone the repository and set PATH
init_repo() {
    git clone https://github.com/your-username/bash-script-project.git
    export PATH=$PATH:$(pwd)/bash-script-project
    echo "Repository cloned and PATH set."
}

# Function to display help information
display_help() {
    echo "Available options:"
    echo "--date, -d: Display today's date"
    echo "--logs [num], -l [num]: Generate log files"
    echo "--error [num], -e [num]: Generate error files"
    echo "--init: Clone the repository and set PATH"
    echo "--help, -h: Display help information"
}

# Main script logic
case "$1" in
    --date|-d)
        display_date
        ;;
    --logs|-l)
        create_logs "$2"
        ;;
    --error|-e)
        create_errors "$2"
        ;;
    --init)
        init_repo
        ;;
    --help|-h)
        display_help
        ;;
    *)
        echo "Invalid option. Use --help or -h to see the available options."
        ;;
esac
