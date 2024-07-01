{
  description = "A flake for Urbit utilities.";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs-new = import nixpkgs { inherit system; };
        pkgs = nixpkgs.legacyPackages.${system};
        isDarwin = system == "x86_64-darwin" || system == "aarch64-darwin";

        extraInputs = if isDarwin then [
          pkgs.darwin.apple_sdk.frameworks.Foundation
          pkgs.libiconv
        ] else
          [ ];

        exclude = pkgs.writeText "exclude-file" ''
          ./
          *.sh
          *.md
          *.txt
        '';

        lensd = pkgs.writeShellScriptBin "lensd" ''
          DESK_DIR=$piers/$pier/$project
          PIER=$(dirname $DESK_DIR)
          DESK=$(basename $DESK_DIR)

          #!/usr/bin/env bash
          port=$(cat $PIER/.http.ports | grep loopback | tr -s ' ' '\n' | head -n 1)
          curl -s                                                              \
            --data "{\"source\":{\"dojo\":\"$1\"},\"sink\":{\"stdout\":null}}" \
            "http://localhost:$port" | xargs printf %s | sed 's/\\n/\n/g'
        '';

        lensa = pkgs.writeShellScriptBin "lensa" ''
          #!/usr/bin/env bash
          DESK_DIR=$piers/$pier/$project
          PIER=$(dirname $DESK_DIR)
          DESK=$(basename $DESK_DIR)
          port=$(cat $PIER/.http.ports | grep loopback | tr -s ' ' '\n' | head -n 1)
          curl -s                                                              \
            --data "{\"source\":{\"dojo\":\"$2\"},\"sink\":{\"app\":\"$1\"}}" \
            "http://localhost:$port" | xargs printf %s | sed 's/\\n/\n/g'
        '';

        watch-copy = pkgs.writeShellScriptBin "watch-copy" ''
          #!/usr/bin/env bash
          watchexec -w $desk copy
        '';
        watch-commit = pkgs.writeShellScriptBin "watch-commit" ''
          #!/usr/bin/env bash
          DESK_DIR=$piers/$pier/$project
          PIER=$(dirname $DESK_DIR)
          DESK=$(basename $DESK_DIR)
          watchexec -w $DESK_DIR lensa 'hood' "\"+hood/commit %$project\""
        '';
        make-ship = pkgs.writeShellScriptBin "make-ship" ''
          #!/usr/bin/env bash
          urbit -F $1 -c $piers/$1
          echo "Created $1 in $piers/$1"
        '';

        clean-deploy = pkgs.writeShellScriptBin "clean-deploy" ''
          #!/usr/bin/env bash
          # use argument for project, otherwise use default
          if [ -z "$1" ] ; then project=$project ; else project=$1 ; fi
          echo "deploying $project to $piers/$pier/$project"
          # copy dir files to pier
          echo "cleaning build dir"
          make clean
          echo "building"
          make
          make build
          echo "cleaning $piers/$pier/$project"
          rm -rf $piers/$pier/$project/*
          echo "copying to $piers/$pier/$project"
          cp -rf full-desk/* $piers/$pier/$project
          lensa 'hood' "+hood/commit %$project"
          lensa 'hood' "+hood/revive %$project"
        '';

        deploy = pkgs.writeShellScriptBin "deploy" ''
          #!/usr/bin/env bash
          # copy dir files to pier
          make clean
          make
          make build
          cp -rf full-desk/* $piers/$pier/$project
        '';
        copy = pkgs.writeShellScriptBin "copy" ''
          #!/usr/bin/env bash
          # copy dir files to pier
          rsync -aL --delete --out-format="%i %n%L" $desk/ $piers/$pier/$project
          # cp -rf $desk $piers/$1/$project
        '';

        fud = pkgs.writeShellScriptBin "fud" ''
          #!/usr/bin/env bash
          cd "$(dirname "$ (realpath "$1") ")"
        '';
        shell = pkgs.mkShell {
          inherit exclude;

          piers = "../";
          project = "neo";
          desk = "./pkg/shrub";
          pier = "master-littel-wolfur";
          SYSTEM = system;
          buildInputs = with pkgs;
            [
              peru
              deploy
              fud
              make-ship
              # vere
              copy
              lensd
              lensa
              curl
              rsync
              clean-deploy
              watch-copy
              watch-commit
            ] ++ extraInputs;
        };
      in {
        packages = { inherit shell; };
        defaultPackage = shell;
      });
}
