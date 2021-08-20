prepare:
	bash refresh_logs.sh
	bash upload_s3.sh
	sync; sync; sync;
	echo 3 > /proc/sys/vm/drop_caches"
	sysctl -p
	systemctl daemon-reload
	systemctl restart nginx
	systemctl restart mysqld
