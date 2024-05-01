{ pkgs, ... }:
let
  nixGL = import <nixgl> { };

  nixGLWrap = pkg:
    let
      bin = "${pkg}/bin";
      executables = builtins.attrNames (builtins.readDir bin);
      wrappedPkg = pkgs.buildEnv {
        name = "nixGL-${pkg.name}";
        paths = [ pkg ] ++ map (name:
          pkgs.hiPrio (pkgs.writeShellScriptBin name ''
            exec -a "$0" ${nixGL.nixGLIntel}/bin/nixGLIntel ${bin}/${name} "$@"
          '')) executables;
      };
    in wrappedPkg // { inherit (pkg) version; };
in {
  programs = {
    fceux.enable = true;
    bat.enable = true;
  };
}
