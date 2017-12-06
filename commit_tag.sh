#!/bin/bash

TAGNAME=$1
WD=`pwd`


cd worktree &&\
	git pull origin master &&\
	git checkout refs/tags/$TAGNAME
	cd .. &&\
	mkdir -p repo/js &&\
	mkdir -p repo/scss &&\
	mkdir -p repo/_vendor &&\
	cp -R worktree/js/* repo/js &&\
	cp -R worktree/scss/* repo/scss &&\
	cp -R worktree/_vendor/* repo/_vendor &&\
	cd repo &&\
	git add . &&\
	git commit -m $TAGNAME &&\
	git tag -a -m $TAGNAME $TAGNAME


cd $WD
