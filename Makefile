PLIST_FILE := ~/Library/LaunchAgents/com.kosmatov.sleepwatcher-wezterm-20compatibility-localuser.plist
SERVICE := com.kosmatov.sleepwatcher-wezterm

backgrounds:
	cp "/Library/Desktop Pictures/*.jpg" images/

change:
	ls images/ | grep -E "(png|jpg|jpeg|gif)" | grep -v mask.png | sort -R | head -1 | { while read str; do sed -i '~' -E "1,/repeat_x/s:[^/]+.(png|jpg|jpeg|gif):$${str}:" ~/.wezterm.lua; done }

install: unload-service remove-service
	@brew list sleepwatcher > /dev/null 2>&1 || brew install sleepwatcher
	@sed s:__workdir__:$(shell pwd): com.kosmatov.sleepwatcher-wezterm.plist > $(PLIST_FILE)
	launchctl load $(PLIST_FILE)

unload-service:
	@launchctl list | grep $(SERVICE) > /dev/null 2>&1 && launchctl unload $(PLIST_FILE) || true

remove-service:
	@launchctl list | grep $(SERVICE) > /dev/null 2>&1 && launchctl remove $(SERVICE) || true

uninstall: unload-service remove-service
	rm $(PLIST_FILE)
