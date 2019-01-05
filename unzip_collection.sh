# Mask of zip files to extract
mask='exclusive_col_*.zip'

sw='/c/Users/User/Desktop/zip_unzip/storage/emulated/0/SpeedSoftware/'
archives_dir="${sw}Archives/"
extracted_dir="${sw}Extracted/"

# Extract all archives by mask
cd $archives_dir
for ar in $mask
do
	cd $extracted_dir
	arch_name="${ar%%.zip}"

	# Delete old extracted data if exists
	if [ -d $arch_name ]; then
		rm -rf $arch_name
		echo "Previous version of ${arch_name} dir has been removed"
	fi
	
	unzip -d $arch_name "${archives_dir}${ar}" >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "$arch_name is unzipped successfully"
	else
		echo "Error occured on unzipping $arch_name"
	fi
done