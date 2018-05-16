{pkgs, stdenv, eslint, source }:
stdenv.mkDerivation rec {
  name = "daedalus-lint-ci";
  buildInputs = [ eslint ];
  buildCommand = ''
    cd ${source}
    ${eslint}/bin/eslint --format=node_modules/eslint-formatter-pretty sources features *.js
    if [ $? == 0 ] || [ $? == 2 ]
    then
      echo $? > $out
    fi
  '';

}
