{pkgs, stdenv, flow, source }:
stdenv.mkDerivation rec {
  name = "daedalus-flow-ci";
  buildInputs = [ flow ];
  buildCommand = ''
    cd ${source}
    ${flow}/bin/flow
    if [ $? == 0 ] || [ $? == 2 ]
    then
      echo $? > $out
    fi
  '';

}
