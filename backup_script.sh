#! /usr/bin/bash

usage() {

	echo "Usage: $0 <source_dir> <destination_dir>"
	exit 1

}

if [ "$#" -ne 2 ] 
then
	usage
fi

source_dir="$1"
destination_dir="$2"

if [ ! -d "$source_dir" ]
then
	echo "Error: Source directory '$source_dir' was not found"
	exit 1
fi

if [ ! -d "$destination_dir" ]
then
	echo "Destination folder does not exist, creating one now..."
	mkdir -p "$destination_dir"
	echo "Created destination directory: $destination_dir"
fi

backup_filename="backup_$(date +'%Y%m%d_%H%M%S').tar.gz"

tar -czf "$destination_dir/$backup_filename" -C "$source_dir" . 

echo "Backup created: $destination_dir/$backup_filename"
