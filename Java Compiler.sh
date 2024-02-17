#!/bin/bash

#This will ask the user for the name of the .java file
echo "Enter the name of your .java file, do not include the extension"
read fileName

name=${fileName}

#These create the needed variables to compile the Java code
tempJar="${name}.jar"
tempClass="${name}.class"
tempJava="${name}.java"

#This will ask the user for the directory of their .java file
echo "Enter the directory of the .java file. Do not use \"~\" or end it with a /"
read fileDirectory

#This will move the active directory to the one requested by the user
cd $fileDirectory

#These establish the needed directories and the text to be put into the manifest file, makes them, then moves all files to there
tempDir="${fileDirectory}/${tempJava}"
finalDir="${fileDirectory}/${name}"
manifestData="Main-Class: ${name}"
#This creates the final directory if it does not exist already
mkdir $finalDir
mv $tempDir $finalDir
cd $finalDir

touch Manifest.txt
echo ${manifestData} > Manifest.txt

javac ${tempJava}
jar cfm ${tempJar} Manifest.txt ${tempClass}

echo "This should've worked but no promises!"
echo "It is saved at ${finalDir}"
