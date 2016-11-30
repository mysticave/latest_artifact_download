# LATEST ARTIFACT DOWNLOAD
Downloading latest artifact from an Artifactory repository using shell script

# Fetching the JSON for downladUri for the latest artifact
latestArtifactUrl=`curl -u username:password --silent https://hostname.com/artifactory/api/storage/<repo_name>/<folder_name>/?lastModified | grep uri | awk '{ print $3 }' | sed s/\"//g | sed s/,//g`

# Fetching the downloadUri for the latest artifact
downloadUrl=`curl -u username:password --silent $latestArtifactUrl | grep downloadUri | awk '{ print $3 }' | sed s/\"//g | sed s/,//g`

# Downloading the latest artifact
curl -u username:password -O $downloadUrl
