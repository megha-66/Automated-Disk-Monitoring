#!/bin/bash 

# setting the variables
THRESHOLD=90 
ALERT_FOLDER="< path-to-folder-you-wanna-monitor-for-space >" # enter your path 
LOGFILE="disk_usage_report.log"



# function to check disk usage

check_disk_usage() {
	echo " Checking Disk usage ...." 
	USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
	echo " Current disk usage : $USAGE%"

        if [ "$USAGE" -ge "$THRESHOLD" ]; then 
		echo "$(date '+%Y-%m-%d %H:%M:%S')- Warning : Disk usage is at ${USAGE}%!" | tee -a $LOGFILE 
		list_large_files
	else
		echo "$(date '+%Y-%m-%d %H:%M:%S')- Disk usage is under control at ${USAGE}%." | tee -a $LOGFILE 
        fi	
}

# function to list top 10 large files/directories
list_large_files() {
	echo " Listing top 10 largest files/directories:" | tee -a $LOGFILE 
	du -ah / 2>/dev/null | sort -rh | head -n 10 | tee -a $LOGFILE 
	echo " Cleanup done." | tee -a $LOGFILE
}

check_disk_usage
echo " Disk usage monitoring complete. Report saved to $LOGFILE."
	 

