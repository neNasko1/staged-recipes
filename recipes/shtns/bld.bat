REM set TMP="%LOCALAPPDATA%\Temp"
REM set TEMP="%LOCALAPPDATA%\Temp"
REM set TMPDIR="%LOCALAPPDATA%\Temp"
if "%ARCH%" == "64" (
set GCC_ARCH=x86_64-w64-mingw32
set EXTRA_FLAGS=-DMS_WIN64
) else (
set GCC_ARCH=i686-w64-mingw32
)
bash -lc "ln -s ${LOCALAPPDATA}/Temp /tmp"
bash -lc "cd src; ./configure --disable-openmp --enable-mkl --enable-python --build=$GCC_ARCH --host=$GCC_ARCH --target=$GCC_ARCH"
bash -lc "cd src; make"
bash -lc "cd src; make install"
