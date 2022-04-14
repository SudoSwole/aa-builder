#!/bin/bash

#####################      Variables     #############################

### Set the proper source and destination directory location

SOURCE_DIR="/source/dir/"
DEST_DIR="/desination/dir/"
TMP_FILE=/tmp/copyfileslist.txt

### Set the username and group name to set permission on copied files
### Set CHANGE_OWNERSHIP to 1 to change ownership or 0 to unchanged it

CHANGE_OWNERSHIP=0
USER='root'
GROUP='root'


########### Do not edit below this until required  #################

### Test if source directory exists
### The script will stop if source not exists

if [ -d "${SOURCE_DIR}" ]; then
        echo "Source directory found"
else
        echo "Source directory not found. Please check above variables are set correctly"
        echo "script exited"
        exit 1
fi

### Test if destination directory exists
### The script will create destination directory if not exists.
### If failed to create directory, the script will terminate

if [ -d "${DEST_DIR}" ]; then
        echo "Destination directory found, all ok"
else
        echo "Destination directory not found, creating now"
        mkdir -p "${DEST_DIR}"
        if [ $? -eq 0 ]; then
                echo "Successfully created destination directory."
        else
                echo "Failed to create destination directory. Script exited"
                exit 1
        fi
fi


### Copy all files available on source directory
### After successfully copying file remove it from source directory.

cd "${SOURCE_DIR}"

if [ $? -eq 0 ]; then
        find . -type f > ${TMP_FILE}

        while read CURRENT_FILE_NAME
        do
                cp --parents "${CURRENT_FILE_NAME}" "${DEST_DIR}"
                if [ $? -eq 0 ]; then
                        echo "File ${CURRENT_FILE_NAME} successfully copied."
                        rm -f "${CURRENT_FILE_NAME}"
                else
                        echo "File ${CURRENT_FILE_NAME} failed to copy"
                fi
        done < ${TMP_FILE}
        rm -f ${TMP_FILE}
fi


## Set the permissions after copying files

if [ ${CHANGE_OWNERSHIP} -eq 1 ]; then
	sudo chmod 775 -R "${DEST_DIR}"
	sudo chown ${USER}:${GROUP} -R "${DEST_DIR}"
fi

###################  End of Script  ###################################
