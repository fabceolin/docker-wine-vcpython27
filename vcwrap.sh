#!/bin/sh
TMP=$HOME/.wine/drive_c/windows/temp/$$.bat
cat > "$TMP" <<EOF
@set VC=%CommonProgramFiles%\\Microsoft\\Visual C++ for Python\\9.0\\
@call "%VC%vcvarsall.bat" >NUL
$(basename $0) %*
EOF
WINEDEBUG=-all wine cmd.exe /c "C:\\Windows\\Temp\\$(basename $TMP)" "$@"
rc=$?
rm -f "$TMP"
exit $rc
