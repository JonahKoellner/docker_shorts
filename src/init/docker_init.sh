system=$(uname)
if [ "$system" -eq "Darwin" ]; then
	#Mac
	echo "[script] Mac Sytem Detected."
	if [ $# -eq 1 ] && [ $1 -eq "42" ]; then
		echo "[script] Starting 42 mac Init in goinfre"
		bash mac/42mac_init.sh
	else
		echo "[open] Opening docker"
		open -g -a Docker
elif [ "$system" -eq "Linux" ]; then
	#linux
	echo "[script] Linux System Detected."
	echo "[systemctl] Starting docker deamon..."
	sudo systemctl start docker
