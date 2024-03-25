#!/system/bin/sh

# Path to the brightness file
brightness_file="/sys/devices/soc/c900000.qcom,mdss_mdp/c900000.qcom,mdss_mdp:qcom,mdss_fb_primary/leds/lcd-backlight/brightness"

# Continuously monitor the brightness value
while true; do
  current_brightness=$(cat $brightness_file)

  # If brightness reaches 2047, change it to 4095
  if [ "$current_brightness" -eq 2047 ]; then
    echo 4095 > $brightness_file
  fi

  sleep 2 # Check every two seconds (adjust the sleep interval if needed)
done
