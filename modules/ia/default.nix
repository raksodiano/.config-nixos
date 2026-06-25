{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    opencode         # AI coding agent (CLI)
    opencode-desktop # AI coding agent (Desktop GUI)
    llama-cpp        # LLM inference engine
  ];
}
