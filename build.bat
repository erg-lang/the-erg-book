@echo off

svn export https://github.com/erg-lang/erg/trunk/doc/EN/syntax/

mdbook build --dest-dir docs/EN

python replace_links.py

timeout 1

rmdir /s /q syntax

svn export https://github.com/erg-lang/erg/trunk/doc/JA/syntax/

mdbook build --dest-dir docs/JA

python replace_links.py

timeout 1

rmdir /s /q syntax

svn export https://github.com/erg-lang/erg/trunk/doc/zh_CN/syntax/

mdbook build --dest-dir docs/zh_CN

python replace_links.py

timeout 1

rmdir /s /q syntax

svn export https://github.com/erg-lang/erg/trunk/doc/zh_TW/syntax/

mdbook build --dest-dir docs/zh_TW

python replace_links.py

timeout 1

rmdir /s /q syntax

echo done
