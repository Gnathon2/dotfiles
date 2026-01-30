{...}:
{

  hardware.bluetooth = {
    enable = true; # can enable it at runtime
    powerOnBoot = false;
  };

  security.rtkit.enable = true;   # rtkit (optional, recommended) allows Pipewire to use the realtime scheduler for increased performance.
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true; 
  }; 

  # services.jack = {
  #   jackd.enable = true;
  #   # support ALSA only programs via ALSA JACK PCM plugin
  #   alsa.enable = true;
  #   # support ALSA only programs via loopback device (supports programs like Steam)
  #   loopback = {
  #     enable = false;
  #     # buffering parameters for dmix device to work with ALSA only semi-professional sound programs
  #     #dmixConfig = ''
  #     #  period_size 2048
  #     #'';
  #   };
  # };
  # users.extraUsers.thomax.extraGroups = [ "jackaudio" ];
}