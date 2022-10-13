@echo off

rmdir /s /q docs
mkdir docs
svn export https://github.com/erg-lang/erg/trunk/doc/JA/syntax/
mdbook build --dest-dir tmp
python replace_links.py
move tmp docs\JA
timeout 1
rmdir /s /q syntax
svn export https://github.com/erg-lang/erg/trunk/doc/zh_CN/syntax/
mdbook build --dest-dir tmp
python replace_links.py
move tmp docs\zh_CN
timeout 1
rmdir /s /q syntax
svn export https://github.com/erg-lang/erg/trunk/doc/zh_TW/syntax/
mdbook build --dest-dir tmp
python replace_links.py
move tmp docs\zh_TW
timeout 1
rmdir /s /q syntax
svn export https://github.com/erg-lang/erg/trunk/doc/EN/syntax/
mdbook build --dest-dir tmp
python replace_links.py
move tmp\* docs\
timeout 1
rmdir /s /q syntax
rmdir /s /q tmp
echo done
