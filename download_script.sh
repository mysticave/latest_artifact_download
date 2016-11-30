latestArtifactUrl=`curl -u username:password --silent https://hostname.com/artifactory/api/storage/<repo_name>/<folder_name>/?lastModified | grep uri | awk '{ print $3 }' | sed s/\"//g | sed s/,//g`

echo $latestArtifactUrl

downloadUrl=`curl -u username:password --silent $latestArtifactUrl | grep downloadUri | awk '{ print $3 }' | sed s/\"//g | sed s/,//g`

echo $downloadUrl

curl -u username:password -O $downloadUrl
