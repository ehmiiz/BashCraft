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

### Regular variables

```bash
myvar=TJABBA

echo $myvar //output TJABBA
```

## Hardware checks

```bash
# Checks storage
df -h
```

```bash
# Checks memory
free -m
```

```bash
# view cpu, view usb
lscpu
lsusb
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

## Grub

```bash
# Set kernel boot parameters

# Open the grub file and edit the parameters
sudo nvim /etc/default/grub

# rewrite the config
sudo grub2-mkconfig -o /etc/grub2.cfg

```


```bash
# To change grub menu boot order

# List the installed kernels
sudo grubby --info=ALL | grep -E "^kernel|^index"

# Set the default where index=NUM is the wanted kernel
sudo grubby --set-default-index=2

# Verify the change
sudo grubby --default-title

```

## VIM / NEOVIM

`esc` to enter command mode
`i` to enter insert
`v` to enter visual mode

: to enter a command
w -> saves without exit
x -> saves and exits
q -> quits without saving
qa! ->
u -> undo last change
ctrl-r -> redo

This section will probably be a bit lengthy xD

### Copy paste

1. Select

    in command mode: `v`
2. Cut/copy
    
    `d` to cut, `y` to copy`

3. Move to target location and paste

    in command mode: `p`


