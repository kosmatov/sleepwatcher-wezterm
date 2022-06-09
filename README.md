sleepwatcher-wezterm
=====================

Automatically changes wezterm background image when the screen is locked or unlocked on Mac OS X

## Installation

```bash
git clone https://github.com/kosmatov/sleepwatcher-wezterm.git
cd sleepwatcher-wezterm
make install
```

Then add images to images/source/ directory, run something like this:

```bash
cp ~/Pictures/Wallpapers/* images/source/
```

Or download wallpapers directly to `images/source/` directory from (uhdpaper.com)[https://www.uhdpaper.com] for example

Then generate backgrounds:

```bash
make backgrounds
```

### Uninstalling

```bash
make uninstall
```
