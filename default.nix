let
  pinnedNixpkgs = import ./pinned-nixpkgs.nix;

  hello = pkgs.writeShellScriptBin "hello" ''
    echo "Hello from the ikkru-store channel overlay 😀!"
  '';

  goodbye = pkgs.writeShellScriptBin "goodbye" ''
    echo "Open Cloud Software"
  '';

  overlays = [
    (self: super: {
      inherit goodbye hello;
    })
  ];

  pkgs = pinnedNixpkgs {
    inherit overlays;
  };
in pkgs
