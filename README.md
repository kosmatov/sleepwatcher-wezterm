sleepwatcher-wezterm
=====================

Automatically changes wezterm background image when the screen is locked or unlocked on Mac OS X

## Installation

```bash
git clone https://github.com/kosmatov/sleepwatcher-wezterm.git
cd sleepwatcher-wezterm
make install
```

Add 4k images to `images/source/` directory, may download from [uhdpaper.com](https://www.uhdpaper.com)

Then generate backgrounds:

```bash
make backgrounds
```

### Uninstalling

```bash
make uninstall
```
