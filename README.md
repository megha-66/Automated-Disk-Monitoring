# Automated Disk Monitoring System – Shell Script

A simple yet effective Bash script to **monitor disk usage** on your Linux system and alert you when usage exceeds a defined threshold. It also logs disk usage reports and lists the largest files/directories to help identify potential cleanup targets.

---

## Features

- [x] Customizable disk usage threshold (default: 90%)
- [x] Automatically checks disk usage of any specified folder
- [x] Logs status with timestamps to `disk_usage_report.log`
- [x] Lists top 10 largest files/directories when usage exceeds threshold
- [x] Easy to run manually or via automation (like cron)

---

## Requirements

- Linux shell (Bash)
- `df`, `du`, `awk`, `sed`, `sort`, `head` – standard utilities

---

## How to Use

1. **Make the script executable:**

```bash
chmod +x disk_monitor.sh
```

2. **Run the Script manually:**

```bash
./diskmanagement.sh /path/to/folder
```
**If you don't provide the path to folder, it defaults to root directory (```/```) -** 

```bash
./diskmanagement.sh
```


