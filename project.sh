if [ -d \source ]; then
    echo "source folder present"
    if [ -d \destination ]; then
        echo "destination folder present"
        echo "copying from source to destination"
        cp \source\/* \destination
    else
        echo "destination folder does not exit"
        echo "creating destination folder"
        mkdir destination
        echo "copying from source to destination"
        cp \source\/* \destination
    fi
else
    echo "source not available hence exiting "
fi
