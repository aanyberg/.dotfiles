# Setup files for fresh installs
A quick way to set up your basic settings and applications for a fresh install of macOS or for when
you change your Mac for a newer model.

1. Setup Git Repo
Clone Github repo down to your hidden `.dotfiles` folder.

```
git clone git@github.com:aanyberg/.dotfiles.git
```

2. Run Brew File
```
source ~/.dotfiles/setup-brew.sh
```

3. Run MacOS Setup File
This sets a lot of personal preference stuff in the OS so be sure you have
a look over to be able to adjust values etc for your own preference.

```
source ~/.dotfiles/setup-macos.sh
```

