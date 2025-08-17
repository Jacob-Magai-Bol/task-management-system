#!/bin/bash

tasks_file="tasks.txt"

# Initialize tasks file if not exists
if [ ! -f "$tasks_file" ]; then
    touch "$tasks_file"
fi

# Function to add task
add_task() {
    echo "Enter task:"
    read task
    if [ ! -z "$task" ]; then
        echo "$task" >> "$tasks_file"
        echo "Task added successfully!"
    else
        echo "Task cannot be empty!"
    fi
}

# Function to view tasks
view_tasks() {
    if [ ! -s "$tasks_file" ]; then
        echo "No tasks found!"
    else
        echo "===== YOUR TASKS ====="
        cat -n "$tasks_file"
        echo "======================"
    fi
}

# Function to remove task
remove_task() {
    view_tasks
    if [ -s "$tasks_file" ]; then
        echo "Enter task number to remove:"
        read num
        if [[ "$num" =~ ^[0-9]+$ ]]; then
            total_tasks=$(wc -l < "$tasks_file")
            if [ "$num" -ge 1 ] && [ "$num" -le "$total_tasks" ]; then
                sed -i "${num}d" "$tasks_file"
                echo "Task $num removed!"
            else
                echo "Invalid task number!"
            fi
        else
            echo "Please enter a valid number!"
        fi
    fi
}

# Function for reminder mode (used by cron)
remind_mode() {
    if [ -s "$tasks_file" ]; then
        echo "===== DAILY REMINDER ====="
        echo "Good morning! Here are your tasks:"
        cat -n "$tasks_file"
        echo "================================"
    fi
}

# Main menu
if [ "$1" = "remind" ]; then
    remind_mode
    exit 0
fi

while true; do
    echo "
===== TASK REMINDER SYSTEM ====="
    echo "1. Add Task"
    echo "2. View Tasks"
    echo "3. Remove Completed Task"
    echo "4. Exit"
    echo "================================"
    read -p "Enter your choice [1-4]: " choice

    case $choice in
        1) add_task ;;
        2) view_tasks ;;
        3) remove_task ;;
        4) echo "Exiting system. Goodbye!"; exit 0 ;;
        *) echo "Invalid option! Please try again." ;;
    esac
done

touch tasks.txt

chmod +x task_reminder.sh

(crontab -l 2>/dev/null; echo "0 8 * * * $(pwd)/task_reminder.sh remind") | crontab -

