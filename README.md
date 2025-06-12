# BashCraft

Follow along and learn Bash by doing!

Level up your [GitHub Actions](https://docs.github.com/en/actions/about-github-actions/understanding-github-actions) skills by learning the legendary [Bash](https://www.gnu.org/software/bash/)!!!

## Files

### cp / mv

- i = asks user if overwrite is ok
- u = only updates (if file exist, if file is newer than the existing, it moves)
- v = verbose

### move file from variable

```bash
file_path=$(realpath ./file)

mv "$filepath" /path/to/destination

```

## More File Operations

### Directory and File Management
```bash
# Create multiple nested directories
mkdir -p parent/child/grandchild

# Create file with timestamp
touch "file-$(date +%Y%m%d).txt"

# Quick file backup
cp file.txt{,.bak}
```

```bash
#!/bin/bash

# Define the source file and destination directory
file="yourfile.txt"
dest_dir="/path/to/destination"

# Get the real path of the file
real_file_path=$(realpath "$file")

# Move the file
mv "$real_file_path" "$dest_dir"
```

### rm

- i, u and v (see above)
- f (--force)
- r (--recursive)

### ln

creates hard or symlinks

hardlink -> `ln file link`

- A hardlink cannot reference anything outside its own filesystem and disk partitionn
- Hard links cannot reference a directory
- A hard link looks like the file itself, if deleted the link is removed, but the file is left in its origin path

symlink -> `ln -s file link`

Similar to Windows Shortcuts

## Processes

Get nicely formated data about a process:

```bash
pgrep -fl processname
```

Gets data about processes

```bash
ps -aux
ps -aux | grep "processname"
```

Gets process id

```bash
pgrep processname
```

### Kill process

```bash
pkill -f "processname"
```

## Services

Manage the service using the servicemanager (systemd or init.d)

```bash
# List services
systemctl list-units --type=service

# Start service
systemctl start <service_name>

# Restart a service
systemctl restart <service_name>

# Enable/disable
systemctl enable <service_name>
systemctl disable <service_name>

# Check status of a service
systemctl status <service_name>

# init.d, legacy service manager
sudo /etc/init.d/service_name start # or `stop`, `restart`, `status`
cat /etc/init.d # lists all services
```

## Find stuff

`-type` is useful, `d` for dir, `f` for file

`-name` followed by an expression

```bash
# Find stuff by name (~ represent path to search, can be `/sbin` etc..)
find ~ -name "filename"

# Find files by extension, home folder, python files
find ~ -name "*.py"

# finds files from different user
find ~ -user username

# finds and deletes empty files {} is placeholder for found file path
find ~ -type f -empty -exec rm {} \;

# changes permish on found files
find ~ -type f -name "*.sh" -exec chmod +x {} \;

# move found files
find ~ -name "*.log" -exec mv {} /path/to/destination/ \;

# modified within the last N days (new files)
find ~ -mtime -7

# modifed more than 30 days ago (old files)
find ~ -mtime +30

```

## Date

```bash
# get todays date
date

# gets the date in 30 days
date -d "+30 days"

# gets the date from 30 days ago
date -d "-30 days"
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

### Add to Path in Bashrc

```bash
# code ~/.bashrc

export PATH="$PATH:$HOME/.cargo/bin"
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

Copy and paste from terminal:

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

## Disk

```bash
# report file system space usage (-h human redable)
df -h
```

```bash
# text based disk usage analyzer (Ncurses disk usage)
ncdu / # system root

ncdu ~ # checks userspace
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
# grub writes it's config by scanning the /boot for kernel images
sudo grub2-mkconfig -o /etc/grub2.cfg

```


```bash
# To change grub menu boot order

# List the installed kernels
rpm -q kernel

# List the installed kernels with more info
sudo grubby --info=ALL | grep -E "^kernel|^index"

# Set the default where index=NUM is the wanted kernel
sudo grubby --set-default-index=2

# Verify the change
sudo grubby --default-title

```

## Here-doc & Here-string

useful to provide multi-line strings to commands

a heredoc is very similar to a here-string in powershell

not to be confused with here-string in bash/python `<<<`, that's useful for feeding a single line of text into a command

```bash
# Heredoc syntax

cat <<EOF
This is my heredoc text
that will be passed to
the 'cat' command
EOF
```

## Help

Get help about commands. A command can be 4 different things:

- Executable (binary)
- Command built-in (like cd)
- A shell function (scripting language function)
- An alias

use `type` to understand what something is

```bash
type bash
# outputs: bash is /usr/bin/bash

type cd
# outputs: No manual entry for diskey
```

```bash
# apropos find commands, wildcard find commands
man -k theme
```

`whatis`, one line docs

```bash
whatis bash
# outputs: bash (1) - GNU Bourne-Again SHell
```

`info`, GNU docs, readable docs

```bash
info info
```


## Alias

- nest many commands in one alias

```bash
# cd to usr, ls, get back to previous working dir
alias lsusr='cd /usr/; ls; cd -'
```

- remove an alias in the session (edit bashrc for perm aliases)

```bash
unalias lsusr
```

- list all session aliases

```bash
alias
```

[[neovim]]

# Terminals and shells

## Unix fileshare permissions

A file where everyone has Read, Write, eXecute:
```
-rwxrwxrwx
```

The first 3 letter represent the "Owner's" permissions (creator of file)

The middle 3 letters represent the "Group's" permissions (can be assigned to a group of users)

The last 3 letters represent "Other", meaning everyone else

## Some examples:

### Everyone (including group and owner) has Read and Execute of a file

```
-r-xr-xr-x
```

###  Only owner has Read, Write, Execute of a file:

```
-rwx------
```

### A folder where everyone has Read, Write, eXecute:

```
drwxrwxrwx
```

### Chmod

To change permissions, use chmod:

```
sudo chmod -R u=rwx,g=rwx,o=rwx DIRECTORY
```

Add execute rights on a python program to the user

```
chmod -x file.py
```

## Add path to $PATH

Allows .py files to be executed from the cmdline

Add to ~/.bashrc for consistency

```
export PATH=$PATH:/home/ehmiiz/git/python
```

## Command History & Shortcuts

### History Operations
```bash
# Search command history
history | grep "command"

# Execute last command
!!

# Execute command number N from history
!N

# Quick substitution from last command (replace old with new)
^old^new
```

### Keyboard Shortcuts
```bash
Ctrl + A  # Move cursor to beginning of line
Ctrl + E  # Move cursor to end of line
Ctrl + U  # Clear line before cursor
Ctrl + K  # Clear line after cursor
Ctrl + R  # Search command history
Ctrl + L  # Clear screen
```

### Text Processing
```bash
# Count lines, words, characters
wc -l file.txt  # lines
wc -w file.txt  # words
wc -c file.txt  # characters

# First/last n lines
head -n 5 file.txt
tail -n 5 file.txt

# Watch file in real-time (useful for logs)
tail -f logfile.txt
```

## Network Operations

### Basic Network Commands
```bash
# Check if host is reachable
ping -c 4 google.com

# Show listening ports
ss -tulpn

# Download files
wget https://example.com/file
curl -O https://example.com/file
```

### Advanced Process Management
```bash
# Run command in background
command &

# Bring background process to foreground
fg %1

# List background jobs
jobs

# Run command immune to hangup (continues after terminal closes)
nohup command &
```
