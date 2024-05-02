# BashCraft

Personal bash tinkering

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