# 📝 Task Reminder System  

![Bash](https://img.shields.io/badge/Shell-Bash-green)  
![License](https://img.shields.io/badge/License-MIT-blue)  
![Status](https://img.shields.io/badge/Status-Completed-success)  

---

## 📌 Introduction  
The **Task Reminder System** is a lightweight **Bash shell script** for managing and tracking daily tasks.  
It provides a **menu-driven interface** for adding, viewing, and removing tasks, while also integrating with **cron jobs** to send **daily reminders**.  

---

## 🎯 Features  
- ➕ **Add tasks** with validation (no empty tasks).  
- 👀 **View tasks** in a neatly numbered list.  
- ❌ **Remove tasks** by selecting their task number.  
- ⏰ **Daily reminder mode** (`remind`) for scheduled notifications.  
- 🔁 **Automated reminders** every morning at **8 AM** using `crontab`.  

---

## ⚙️ Implementation Details  
- Tasks are stored in a simple text file: **`tasks.txt`**.  
- Core Linux commands used:  
  - `cat -n` → Display tasks with numbers.  
  - `sed -i` → Remove tasks by line number.  
  - `wc -l` → Count tasks for validation.  
- Script structure:  
  - Functions: `add_task`, `view_tasks`, `remove_task`, `remind_mode`.  
  - **Menu loop** for continuous interaction.  
  - **Reminder Mode** triggered when run with argument:  

```bash
./task_reminder.sh remind
🛠️ Setup Instructions
Follow these steps to install and run the Task Reminder System:

Create the script file

bash
Copy
Edit
nano task_reminder.sh
Paste the script code into the file and save it.

Make the script executable

bash
Copy
Edit
chmod +x task_reminder.sh
Create an empty tasks file (if not auto-created)

bash
Copy
Edit
touch tasks.txt
Run the script manually

bash
Copy
Edit
./task_reminder.sh
Enable daily reminders at 8 AM using cron
Add the following line to crontab:

bash
Copy
Edit
(crontab -l 2>/dev/null; echo "0 8 * * * $(pwd)/task_reminder.sh remind") | crontab -
This ensures you get a daily reminder of your tasks every morning at 8 AM.

🖥️ Example Usage
Menu Example
markdown
Copy
Edit
===== TASK REMINDER SYSTEM =====
1. Add Task
2. View Tasks
3. Remove Completed Task
4. Exit
================================
Enter your choice [1-4]:
Reminder Example (via cron at 8 AM)
markdown
Copy
Edit
===== DAILY REMINDER =====
Good morning! Here are your tasks:
 1  Finish assignment
 2  Prepare presentation
================================
🚀 Future Improvements
📌 Add task priorities (High / Medium / Low).

📅 Support due dates and deadlines.

🔔 Integrate with desktop/email notifications.

☁️ Option to sync tasks across devices.

🔧 Troubleshooting
Script not executable? → Run chmod +x task_reminder.sh

Cron job not triggering?

Ensure cron service is running:

bash
Copy
Edit
sudo service cron start
Check cron jobs with:

bash
Copy
Edit
crontab -l
No tasks showing? → Ensure tasks.txt exists and is not empty.

✅ Conclusion
The Task Reminder System is a practical example of Linux scripting, file handling, and automation.
It provides a simple yet effective tool for daily task tracking and productivity.

📄 License
This project is licensed under the MIT License – feel free to use and modify it.