#!/bin/bash

if [ `which curl` ]; then
    DL_CMD='curl -O'
elif [ `which wget` ]; then
    DL_CMD='wget'
else
    echo 'no download command found! install either curl or wget'
    exit 1
fi

echo 'cleaning up...'
rm -rf data tmp
mkdir -p data tmp
echo 'done.'

echo 'creating address.txt...'
( cd tmp && \
    $DL_CMD 'http://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip' && \
    unzip ken_all.zip )
iconv -f sjis -t utf-8 < tmp/KEN_ALL.CSV | python address.py > data/address.txt
echo 'done.'

echo 'creating inflection.table.txt...'
( cd data/ && \
    $DL_CMD 'http://lexsrv3.nlm.nih.gov/LexSysGroup/Projects/lexicon/2012/release/LEX/MISC/inflection.table' && \
    mv inflection.table inflection.table.txt )
echo 'done.'

# echo 'creating medline.txt...'
# #MEDLINE_TGZ='ftp://ftp.ncbi.nlm.nih.gov/pub/pmc/articles.A-B.tar.gz 
# #ftp://ftp.ncbi.nlm.nih.gov/pub/pmc/articles.C-H.tar.gz $DL_CMD
# #ftp://ftp.ncbi.nlm.nih.gov/pub/pmc/articles.I-N.tar.gz
# #ftp://ftp.ncbi.nlm.nih.gov/pub/pmc/articles.O-Z.tar.gz'
# MEDLINE_TGZ='ftp://ftp.ncbi.nlm.nih.gov/pub/pmc/articles.A-B.tar.gz'
# ( cd tmp/ && \
#     for f in $MEDLINE_TGZ; do
# 	$DL_CMD $f
# 	tar -zxvf $f
#     done )
# bash medline.sh < tmp/*.xml > data/medline.txt
# echo 'done.'
