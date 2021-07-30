cd src/sqlite-autoconf-3360000
nmake -f Makefile.msc DEBUG=2 clean
cd ../../

cd src/iconv-for-windows-master
nmake -f Makefile DEBUG=1 clean
cd ../../

cd  src/freexl-1.0.6
nmake -f makefile64.vc DEBUG=1 clean
cd ../../

cd  src/librttopo
nmake -f makefile.vc DEBUG=1 clean 
cd ../../

cd  src/libspatialite-5.0.1
nmake -f makefile64.vc DEBUG=1 clean
cd ../../

set MYHOME=%~dp0
cd  src/gdal-3.3.1
nmake -f makefile.vc MSVC_VER=1900 DEBUG=1 WIN64=1  clean
cd ../../