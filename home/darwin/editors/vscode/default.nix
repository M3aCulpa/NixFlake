{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      yzhang.markdown-all-in-one
      ms-dotnettools.csharp
      ms-dotnettools.csdevkit
      ms-azuretools.vscode-docker
      golang.go
      hashicorp.terraform
      ms-vscode.makefile-tools
      ms-python.vscode-pylance
      ms-python.python
      ms-python.debugpy
      ms-toolsai.jupyter
    ];
  };
}
