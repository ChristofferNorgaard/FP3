{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell
{
  nativeBuildInputs = with pkgs; [
    julia_19
  ];

LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
    stdenv.cc.cc
    libGL
    zlib
    julia_19
    glib # libgthread-2.0.so
    xorg.libX11 # libX11-xcb.so
    xorg.libxcb # libxcb-shm.so
    xorg.xcbutilwm # libxcb-icccm.so
    xorg.xcbutil # libxcb-util.so
    xorg.xcbutilimage # libxcb-image.so
    xorg.xcbutilkeysyms # libxcb-keysyms.so
    xorg.xcbutilrenderutil # libxcb-renderutil.so
    xorg.xcbutilrenderutil # libxcb-renderutil.so
    dbus # libdbus-1.so
    libxkbcommon # libxkbcommon-x11.so
    fontconfig
    freetype
  ];
}
