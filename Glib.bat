SET SourceFile=glib-2.79.3

if not exist glib-2.79.3.tar.xz (
    powershell curl -o "glib.tar.xz" "https://mirror.ossplanet.net/gnome/sources/glib/2.79/%SourceFile%.tar.xz"
)

tar -zxf .\glib.tar.xz

cd %SourceFile%/subprojects

powershell curl -f "zlib.wrap" "https://wrapdb.mesonbuild.com/v2/zlib_1.3.1-1/zlib.wrap"

cd ..

meson build --prefix=d:\glib\binary
meson compile -C build
ninja -C build install

pause
