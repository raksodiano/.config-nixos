{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    llama-cpp # LLM inference engine
  ];
}
