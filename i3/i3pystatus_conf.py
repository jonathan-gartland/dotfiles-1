# -*- coding: utf-8 -*-

# https://github.com/enkore/i3pystatus

import subprocess
from i3pystatus import Status
from i3pystatus.mail import imap
from utils import get_imap_password, which

status = Status(standalone=True)

# Displays clock
status.register("clock", format="%a %-d %b %Y %X",)

# Shows the average load of the 1, 5 and 15 minutes
# (the default value for format is used)
status.register("load", format="{avg1} {avg5} {avg15}")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp", format="{temp:.0f}°C",)

# shows memory load
status.register("mem", format="{avail_mem} GiB", divisor=1024**3)

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk", path="/", format="/ {avail}G",round_size=0)

# Shows disk usage of /home
status.register("disk", path="/home", format="/home {avail}G",round_size=0)

# Shows pulseaudio default sink volume
status.register("pulseaudio", format="♪{volume} {muted}",)

# shows CPU Usage as a bar
#status.register("cpu_usage_bar",
#        format="{usage_bar}")

if which("mpd"):
    # Shows mpd status
    status.register("mpd",
        format="{artist} ─ {album} ─ {title}  {status}",
        status={
            "pause": "▷",
            "play": "▶",
            "stop": "◾",
        },)

# shows weather info
status.register("weather",
    location_code="03820",
    units="imperial",
    colorize=True,
    format="{current_temp}")

# shows unread message count on INBOX
status.register("mail",
    hide_if_null = False,
    email_client = "/usr/bin/thunderbird",
    backends=[ imap.IMAP(
             # port and ssl are the defaults
             port=993, ssl=True,
             host="knight.cx",
             username="skk",
             password = get_imap_password("~", ".i3", "imap_password.txt")
            )])
status.run()


# This would also display a desktop notification (via dbus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
#status.register("battery",
#    format="{status}/{consumption:.2f}W {percentage:.2f}% [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}",
#    alert=True,
#    alert_percentage=5,
#    status={
#        "DIS": "↓",
#        "CHR": "↑",
#        "FULL": "=",
#    },)

# This would look like this:
# Discharging 6h:51m
#status.register("battery",
#    format="{status} {remaining:%E%hh:%Mm}",
#    alert=True,
#    alert_percentage=5,
#    status={
#        "DIS":  "Discharging",
#        "CHR":  "Charging",
#        "FULL": "Bat full",
#    },)

# Displays whether a DHCP client is running
#status.register("runwatch",
#    name="DHCP",
#    path="/var/run/dhclient*.pid",)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
# status.register("network",
#     interface="enp15s0",
#     format_up="{v4cidr}",)

# Has all the options of the normal network and adds some wireless specific things
# like quality and network names.
#
# Note: requires both netifaces and basiciw
#status.register("wireless",
#    interface="wlan0",
#    format_up="{essid} {quality:03.0f}%",)
