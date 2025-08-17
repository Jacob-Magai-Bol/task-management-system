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
