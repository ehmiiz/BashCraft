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