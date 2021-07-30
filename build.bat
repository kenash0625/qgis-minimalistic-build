set PATH="C:\Program Files\7-Zip";D:\cmake-3.20.5-windows-x86_64\bin;D:\api\py396;D:\Qt\5.13.2\msvc2017_64\bin;%PATH%;
set MYHOME=%~dp0
cd src 
7z x -aos src.7z
7z x -aos QGIS-final-3_20_1.7z
cd ..
mkdir output64
cd output64
curl -O https://github.com/kenash0625/qgis-minimalistic-build/releases/download/output64/output64.zip
7z x -aos output64.zip
del /F /Q output64.zip
cd ..
cmake -G "Visual Studio 15 2017" -A x64 -S src/QGIS-final-3_20_1 -B project64\qgis -D CMAKE_INSTALL_PREFIX=output64
cmake --build project64\qgis --config Debug --target INSTALL


