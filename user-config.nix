{
  pkgs,
  pkgs-unstable,
  ...
}:
let
  catppuccinStyle = "frappe";
in
{
  catppuccin = import ./catppuccin/${catppuccinStyle}.nix;
  catppuccinStyle = catppuccinStyle;
  i18n = {
    language = "zh-cn";
  };
  zed-extensions = [
    "nix"
    "toml"
    "html"
    "opencode"
  ];

  vscode-extensions = with pkgs-unstable.nix-vscode-extensions.vscode-marketplace; [
    github.copilot-chat
    johnny-zhao.oai-compatible-copilot
    ms-ceintl.vscode-language-pack-zh-hans
    mhutchie.git-graph
    eamodio.gitlens
    bierner.markdown-mermaid
    ms-vscode.remote-explorer
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-ssh-edit
  ];
}
