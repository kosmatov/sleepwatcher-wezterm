PLIST_FILE := ~/Library/LaunchAgents/com.kosmatov.sleepwatcher-wezterm-20compatibility-localuser.plist
SERVICE := com.kosmatov.sleepwatcher-wezterm

backgrounds: install-imagemagick
	ls images/source | grep -E '.+\.jpg' | { while read str; do magick composite images/source/mask.png "images/source/$${str}" "images/$$(echo "$${str}" | sed -E -e s/-uhd.+/.png/)"; done }

change:
	ls ~/sleepwatcher-wezterm/images/ | grep png | sort -R | head -1 | { while read str; do sed -i '~' -E "s:[^/]+.png:$${str}:" ~/.wezterm.lua; done }

install: unload-service remove-service
	@brew list sleepwatcher > /dev/null 2>&1 || brew install sleepwatcher
	ln -sfv $(shell pwd)/$(shell basename $(PLIST_FILE)) ~/Library/LaunchAgents/
	launchctl load $(PLIST_FILE)

unload-service:
	@launchctl list | grep $(SERVICE) > /dev/null 2>&1 && launchctl unload $(PLIST_FILE) || true

remove-service:
	@launchctl list | grep $(SERVICE) > /dev/null 2>&1 && launchctl remove $(SERVICE) || true

uninstall: unload-service remove-service
	rm $(PLIST_FILE)

install-imagemagick:
	@which magick > /dev/null 2>&1 || brew install imagemagick
