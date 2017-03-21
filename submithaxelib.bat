@echo off
del prismic-hx.zip >nul 2>&1

cd src
copy ..\README.md .
zip -r ..\prismic-hx.zip .
del README.md
cd ..

haxelib submit prismic-hx.zip
del prismic-hx.zip
