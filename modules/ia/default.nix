{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    opencode # AI coding agent (CLI)
    llama-cpp # LLM inference engine
  ];
}
