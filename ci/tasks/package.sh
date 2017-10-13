#!/bin/bash

set -e +x
 
  echo "About to build"
pushd movie-fun
  echo "Packaging WAR"
  ./mvn clean package -DskipTests -Dmaven.test.skip=true
popd
   
  echo "Building done"


jar_count=`find movie-fun/target -type f -name *.war | wc -l`
echo " Found the WAR"

if [ $jar_count -gt 1 ]; then
  echo "More than one war found, don't know which one to deploy. Exiting"
  exit 1
fi
echo "move the file to package output"
find movie-fun/target -type f -name *.war -exec cp "{}" package-output/moviefun.war \;

echo "Done packaging"
