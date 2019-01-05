# Mask of dirs to zip
mask='*exclusive_coll_*'

sw='/storage/emulated/0/SpeedSoftware/'
archives_dir="${sw}Archives/"
extracted_dir="${sw}Extracted/"

# Zip all collection dirs by mask
cd $extracted_dir
for d in $mask
do
	archive="${d}.zip"

	# Delete previous version of archives if exists
	pushd . >/dev/null 2>&1
	cd $archives_dir
	if [ -e $archive ]; then
		rm -rf $archive
	fi
	popd >/dev/null 2>&1

	# Zip collections into corresponding archives
	cd $d
	zip -r "${archives_dir}${archive}" * >/dev/null 2>&1
	retval=$?
	cd ..
	if [ $retval -eq 0 ]; then
		echo "$d is zipped successfully"
		# Delete zipped directories
		rm -rf $d
	else
		echo "Error occured on zipping $d"
	fi
done