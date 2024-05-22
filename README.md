# BashCraft

Personal bash tinkering

## Find a process

Gets data about processes

```bash
ps -aux
ps -aux | grep "processname"
```

Gets process id

```bash
pgrep processname
```


## Kill process

```bash
pkill -f "processname"
```

## Reboot & Shutdown

The recommended way is via systemd, using the systemctl command

Shutsdown the computer in a controlled manner and logs it



```bash
sudo systemctl reboot

sudo systemctl poweroff
```

Shutsdown or reboots without systemd

```bash
sudo shutdown -h -now
reboot
```

## Logs

journalctl (journald) can be used on systems with systemd to view logs

```bash
# similar to tail -n 50
journalctl -n 50
```

```bash
# print all of the info using the -a option, grep "CPU" and view interactivly with less
journalctl -a | grep "CPU" | less
```

```bash
# syslog msg levels

#    0: emerg
#    1: alert
#    2: crit
#    3: err
#    4: warning
#    5: notice
#    6: info
#    7: debug

# shows all the `err` msg's for this boot
journalctl -p err -b
```

```bash
# logs in reverse order (new first)
journalctl -r
```

```bash
# logs only for 24h back
# --since "2024-05-22" 
journalctl --since=yesterday --until=now
```

dmesg prints or controls the kernel ring buffer

can be used to view kernel related logs

```bash
# displays nvidia related kernel logs
sudo dmesg | grep nvidia
```

## (Environment) Variables

```bash
# Create an environment variable, key = HELLO / value = "Hello World!"
export HELLO="Hello World!"

# Print Hello World!
echo $HELLO
```

```bash
variable_example="variable example!"
int_variable=25

echo $variable_example
echo $int_variable

# Addition syntax example
echo $((int_variable + int_variable)) 
~$ 50
```

## Copy and Paste (Wayland)

```bash
cat ./file.txt | wl-copy

wl-paste
```

## Improved ls and cat

```bash
lsd ./file.txt ./file1.txt

bat ./file.txt
```

## Find commands

```bash

# looks for binary name in bin & sbin
which -a wine

# looks for keyword in description (apropos)
man -k clip

```


## Convert mp4 to gif

```bash
ffmpeg -i Recording.mp4 -vf "fps=10,scale=640:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 Recording.gif
```