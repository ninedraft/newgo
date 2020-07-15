#!/usr/bin/env bash

project=$1
module=github.com/$(cat $HOME/.config/newgo/github)/$project
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
user=$(git config user.name)
year=$(date +"%Y")

mkdir -p $project
cd $project
mkdir -p pkg
mkdir -p $project

cp $DIR/go.gitignore .gitignore
cp $DIR/golangci.yml .golangci.yml

echo "package $project" > $project/$project.go
cat $DIR/project.og >> $project/$project.go

echo "Copyright $year $user" > LICENSE
cat $DIR/APACHE.license >> LICENSE

git init 
go mod init $module
git add .
git commit -m "embark the project"
gh repo create
