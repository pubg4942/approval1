if [ -d C:/Users/Regenerate/Desktop/hardwork/source ]; then
    echo "source folder present"
    if [ -d C:/Users/Regenerate/Desktop/hardwork/destination ]; then
        echo "destination folder present"
        echo "copying from source to destination"
        cp C:/Users/Regenerate/Desktop/hardwork/source/* C:/Users/Regenerate/Desktop/hardwork/destination
    else
        echo "destination folder does not exit"
        echo "creating destination folder"
        mkdir destination
        echo "copying from source to destination"
        cp C:/Users/Regenerate/Desktop/hardwork/source/* C:/Users/Regenerate/Desktop/hardwork/destination
    fi
else
    echo "source not available hence exiting"
fi
