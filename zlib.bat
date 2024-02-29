SET SourceFile=zlib-1.3.1

if not exist zlib.tar.gz (
    powershell curl -o "zlib.tar.gz" "https://www.zlib.net/fossils/%SourceFile%.tar.gz"
)

tar -zxf .\zlib.tar.gz
cd %SourceFile%
cmake -G "Visual Studio 17 2022" -A x64 -B out -S .
msBuild.exe -property:Configuration=Release .\out\zlib.vcxproj"

@REM 拷贝dll
xcopy /y out\Release\*.dll D:\gtk_compilation\vs17\x64\bin

@REM 拷贝lib
xcopy /y out\Release\*.lib D:\gtk_compilation\vs17\x64\lib

@REM 拷贝头文件
xcopy /y .\zlib.h D:\gtk_compilation\vs17\x64\include
xcopy /y .\out\zconf.h D:\gtk_compilation\vs17\x64\include