set PATH="C:\Program Files\7-Zip";D:\cmake-3.20.5-windows-x86_64\bin;D:\api\py396;D:\Qt\5.13.2\msvc2017_64\bin;%PATH%;
set MYHOME=%~dp0
cd src 
7z x -aos src.7z
7z x -aos QGIS-final-3_20_1.7z
cd ..
mkdir project64\qwt
cd project64\qwt
qmake ../../src/qwt-6.1.6/qwt.pro
nmake -f makefile debug
nmake -f makefile debug install
cd ../../

mkdir project64\QScintilla
cd project64\QScintilla
qmake ../../src/QScintilla_src-2.13.0/src/qscintilla.pro
nmake -f makefile.debug
nmake -f makefile.debug install
cd ../../

cmake -G "Visual Studio 15 2017" -A x64 -S src/qca-2.3.1 -B project64\qca -D CMAKE_INSTALL_PREFIX=output64 -D MYQTDIR="D:/Qt/5.13.2/msvc2017_64/lib/cmake/"
cmake --build project64\qca --config Debug --target INSTALL

cmake -G "Visual Studio 15 2017" -A x64 -S src/qtkeychain-0.12.0 -B project64\qtkeychain -D CMAKE_INSTALL_PREFIX=output64 -D MYQTDIR="D:/Qt/5.13.2/msvc2017_64/lib/cmake/"
cmake --build project64\qtkeychain --config Debug --target INSTALL

cmake -G "Visual Studio 15 2017" -A x64 -S src/zlib-1.2.11 -B project64\zlib -D CMAKE_INSTALL_PREFIX=output64
cmake --build project64\zlib --config Debug --target INSTALL

cmake -G "Visual Studio 15 2017" -A x64 -S src/libzip-1.8.0 -B project64\libz -D CMAKE_INSTALL_PREFIX=output64
cmake --build project64\libz --config Debug --target INSTALL

cd src/sqlite-autoconf-3360000
nmake -f Makefile.msc DEBUG=2 
copy /Y sqlite3staticd.lib ..\..\output64\lib
cd ../../

cd src/iconv-for-windows-master
nmake -f Makefile DEBUG=1 
copy /Y iconv.lib ..\..\output64\lib
cd ../../

cmake -G "Visual Studio 15 2017" -A x64 -S src/exiv2-0.27.4-Source -B project64\exiv2 -D CMAKE_INSTALL_PREFIX=output64
cmake --build project64\exiv2 --config Debug --target INSTALL

cmake -G "Visual Studio 15 2017" -A x64 -S src/proj-8.1.0 -B project64\proj -D CMAKE_INSTALL_PREFIX=output64
cmake --build project64\proj --config Debug --target INSTALL


cmake -G "Visual Studio 15 2017" -A x64 -S src/spatialindex-src-1.9.3 -B project64\spatialindex -D CMAKE_INSTALL_PREFIX=output64
cmake --build project64\spatialindex --config Debug --target INSTALL

cmake -G "Visual Studio 15 2017" -A x64 -S src/protobuf-3.17.3\cmake -B project64\protobuf -D CMAKE_INSTALL_PREFIX=output64
cmake --build project64\protobuf --config Debug --target INSTALL


cmake -G "Visual Studio 15 2017" -A x64 -S src/libexpat-R_2_4_1\expat -B project64\expat -D CMAKE_INSTALL_PREFIX=output64
cmake --build project64\expat --config Debug --target INSTALL

cmake -G "Visual Studio 15 2017" -A x64 -S src/geos-3.8.2 -B project64\geos -D CMAKE_INSTALL_PREFIX=output64
cmake --build project64\geos --config Debug --target INSTALL


cd  src/freexl-1.0.6
nmake -f makefile64.vc DEBUG=1 
nmake -f makefile64.vc DEBUG=1 install
cd ../../

cd  src/librttopo
nmake -f makefile.vc DEBUG=1
nmake -f makefile.vc DEBUG=1 install 
cd ../../

cmake -G "Visual Studio 15 2017" -A x64 -S src/libxml2-v2.9.12 -B project64\libxml2 -D CMAKE_INSTALL_PREFIX=output64
cmake --build project64\libxml2 --config Debug --target INSTALL

cd  src/libspatialite-5.0.1
nmake -f makefile64.vc DEBUG=1 
nmake -f makefile64.vc DEBUG=1 install
cd ../../


cd  src/gdal-3.3.1
nmake -f makefile.vc MSVC_VER=1900 DEBUG=1 WIN64=1  
nmake -f makefile.vc MSVC_VER=1900 DEBUG=1 WIN64=1  install
nmake -f makefile.vc MSVC_VER=1900 DEBUG=1 WIN64=1  devinstall
cd ../../



