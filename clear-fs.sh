#!/bin/sh

cd build/seafile-data/storage/
cd blocks && rm -rf * && cd -
cd commits && rm -fr * && cd -
cd fs && rm -rf * && cd -

tree

cd ../
sqlite3 seafile.db "delete from Branch where 1=1;"
sqlite3 seafile.db "delete from GarbageRepos where 1=1;"
sqlite3 seafile.db "delete from InnerPubRepos where 1=1;"
sqlite3 seafile.db "delete from Repo where 1=1;"
sqlite3 seafile.db "delete from RepoGroup where 1=1;"
sqlite3 seafile.db "delete from RepoHead where 1=1;"
sqlite3 seafile.db "delete from RepoHistoryLimit where 1=1;"
sqlite3 seafile.db "delete from RepoOwner where 1=1;"
sqlite3 seafile.db "delete from RepoSize where 1=1;"
sqlite3 seafile.db "delete from RepoTokenPeerInfo where 1=1;"
sqlite3 seafile.db "delete from RepoUserToken where 1=1;"
sqlite3 seafile.db "delete from RepoValidSince where 1=1;"
sqlite3 seafile.db "delete from SharedRepo where 1=1;"
sqlite3 seafile.db "delete from SharedRepo where 1=1;"
sqlite3 seafile.db "delete from VirtualRep where 1=1;"

