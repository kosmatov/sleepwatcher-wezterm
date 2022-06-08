sleepwatcher-wezterm
=====================

Automatically changes wezterm background image when the screen is locked or unlocked on Mac OS X.

## Installation

This tool uses [SleepWatcher](http://www.bernhard-baehr.de/) to be notified when the screen goes to sleep.
Since SleepWatcher is licensed under the GPL, it can't be bundled with this tool, you have to install it separately.
The easiest way to do this is through [Homebrew](https://brew.sh):

```bash
brew install sleepwatcher
```

Once SleepWatcher is installed locally (ignore the steps printed by Homebrew), you need to clone this repository to a local directory on your Mac:

```bash
git clone https://github.com/kosmatov/sleepwatcher-wezterm.git
```

This will create a new directory with the contents of this repo. Change into this directory and install the provided default scripts:

```bash
cd sleepwatcher-wezterm

./install.sh
```

Then add images to images/ directory, run something like this:

```bash
cp ~/Pictures/Wallpapers/* images/
```

Or download wallpapers directly to images/ directory from https://www.uhdpaper.com/ for example

### Uninstalling

To remove the sleepwatcher integration, simply call the provided uninstall script:

```bash
cd sleepwatcher-wezterm

./uninstall.sh
```

