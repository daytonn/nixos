{ lib, appimageTools, fetchurl, makeWrapper }:

let
  pname = "cursor";
  version = "1.6.26";

  src = fetchurl {
    url = "https://downloads.cursor.com/production/6af2d906e8ca91654dd7c4224a73ef17900ad735/linux/x64/Cursor-1.6.26-x86_64.AppImage";
    sha256 = "sha256-b2RtSZ1qbRwqbliZZtLA0255Gzm0RUW8hvgVDWvLjWU=";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };

in appimageTools.wrapType2 rec {
  inherit pname version src;

  extraInstallCommands = ''
    # Find the actual binary name and rename it only if it's different
    binary_name=$(ls $out/bin/ | head -1)
    if [ -n "$binary_name" ] && [ "$binary_name" != "${pname}" ]; then
      mv $out/bin/$binary_name $out/bin/${pname}
    fi

    # Install desktop file and icon if they exist
    if [ -f ${appimageContents}/cursor.desktop ]; then
      install -m 444 -D ${appimageContents}/cursor.desktop $out/share/applications/cursor.desktop
      # Fix the desktop file to point to the correct binary
      substituteInPlace $out/share/applications/cursor.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}' \
        --replace 'Icon=cursor' 'Icon=${pname}'
    fi

    # Install icon if it exists (try different possible names)
    for icon in cursor.png cursor.svg icon.png icon.svg; do
      if [ -f ${appimageContents}/$icon ]; then
        install -m 444 -D ${appimageContents}/$icon $out/share/pixmaps/${pname}.png
        break
      fi
    done
  '';

  meta = with lib; {
    description = "The AI-first code editor. Built to make you extraordinarily productive";
    longDescription = ''
      Cursor is a code editor built for pair-programming with AI. It's built on top of VSCode
      and includes features like AI-powered code completion, chat, and code generation.
    '';
    homepage = "https://cursor.com";
    license = licenses.unfree; # Cursor is proprietary
    platforms = [ "x86_64-linux" ];
    maintainers = [ ]; # Add your name if you want
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
  };
}
