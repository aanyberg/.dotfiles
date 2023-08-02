# Setup files for fresh installs

Install Homebrew.

[https://brew.sh/](https://brew.sh/)

1. Run Brew File
```
source ~/.dotfiles/setup-brew.sh
```

2. Setup Git Repo
Clone Github repo down to your hidden `.dotfiles` folder.

```
git clone git@github.com:aanyberg/.dotfiles.git
```

3. Run MacOS Setup File
This sets a lot of personal preference stuff in the OS so be sure you have
a look over to be able to adjust values etc for your own preference.

```
source ~/.dotfiles/setup-macos.sh
```

