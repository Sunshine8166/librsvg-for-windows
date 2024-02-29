SET SourceFile=release-74-2

if not exist icu.tar.gz (
    powershell curl -o "icu.tar.gz" "https://codeload.github.com/unicode-org/icu/tar.gz/refs/tags/%SourceFile%"
)

tar -zxf .\icu.tar.gz

cd icu-%SourceFile%\icu4c
msbuild source\allinone\allinone.sln /p:Configuration=Release /p:Platform=x64 /p:SkipUWP=true

@REM 拷贝dll
xcopy /y bin64\*.dll D:\gtk_compilation\vs17\x64\bin
xcopy /y bin64\*.exe D:\gtk_compilation\vs17\x64\bin

@REM 拷贝lib
xcopy /y lib64\*.lib D:\gtk_compilation\vs17\x64\lib

@REM 拷贝头文件
xcopy /y /s /e /d .\include\unicode D:\gtk_compilation\vs17\x64\include\unicode\