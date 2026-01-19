{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.ollama = {
    enable = false;
    loadModels = [
      "qwen2.5:0.5b"
      "qwen2.5:1.5b"
      "qwen2.5:3b"
      "qwen2.5-coder:0.5b"
      "qwen2.5-coder:1.5b"
      "qwen2.5-coder:3b"
      "phi3:mini"
      "gemma2:2b"
    ];
  };
}
