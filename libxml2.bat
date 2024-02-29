SET SourceFile=libxml2-2.12.5

if not exist libxml2.tar.xz (
    powershell curl -o "libxml2.tar.xz" "https://mirror.ossplanet.net/gnome/sources/libxml2/2.12/%SourceFile%.tar.xz"
)

tar -zxf .\libxml2.tar.xz

cd %SourceFile%/win32

cscript configure.js zlib=yes icu=yes iconv=no compiler=msvc prefix=d:\gtk_compilation\vs17\x64 include=D:\gtk_compilation\vs17\x64\include lib=D:\gtk_compilation\vs17\x64\lib

call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
nmake /f Makefile.msvc

@REM 拷贝dll
xcopy /y bin.msvc\*.dll D:\gtk_compilation\vs17\x64\bin
xcopy /y bin.msvc\*.exe D:\gtk_compilation\vs17\x64\bin

@REM 拷贝lib
xcopy /y bin.msvc\*.lib D:\gtk_compilation\vs17\x64\lib

@REM 拷贝头文件
