#!/bin/sh

mkdir -p .spigot/build
cd .spigot/build

wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar -O BuildTools.jar

java -jar BuildTools.jar --rev 1.15.1

cd ../..

mkdir -p .spigot/jars

cp .spigot/build/Spigot/Spigot-Server/target/spigot*.jar .spigot/jars


