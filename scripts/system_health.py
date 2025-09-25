#!/usr/bin/env python3
import psutil
import time
import logging

# Configure logging
logging.basicConfig(filename="system_health.log", level=logging.INFO, format="%(asctime)s - %(message)s")

# Thresholds
CPU_THRESHOLD = 80
MEMORY_THRESHOLD = 80
DISK_THRESHOLD = 80

def check_system_health():
    cpu = psutil.cpu_percent(interval=1)
    memory = psutil.virtual_memory().percent
    disk = psutil.disk_usage("/").percent
    processes = len(psutil.pids())

    alerts = []
    if cpu > CPU_THRESHOLD:
        alerts.append(f"High CPU usage detected: {cpu}%")
    if memory > MEMORY_THRESHOLD:
        alerts.append(f"High memory usage detected: {memory}%")
    if disk > DISK_THRESHOLD:
        alerts.append(f"Low disk space: {disk}% used")

    if alerts:
        for alert in alerts:
            print(alert)
            logging.warning(alert)
    else:
        logging.info(f"System is healthy: CPU={cpu}%, Memory={memory}%, Disk={disk}%, Processes={processes}")

if __name__ == "__main__":
    while True:
        check_system_health()
        time.sleep(30)
