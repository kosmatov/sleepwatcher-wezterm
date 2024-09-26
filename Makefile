PLIST_FILE := /Library/LaunchAgents/com.kosmatov.sleepwatcher-wezterm-20compatibility-localuser.plist
SERVICE := com.kosmatov.sleepwatcher-wezterm
MONTH := $(shell date +%m)

backgrounds:
	cp "/Library/Desktop Pictures/*.jpg" images/

change:
	$(if $(shell [ $(MONTH) -gt 2 ] && [ $(MONTH) -lt 6 ] && echo 1),$(eval THEME := spring),)
	$(if $(shell [ $(MONTH) -gt 5 ] && [ $(MONTH) -lt 9 ] && echo 1),$(eval THEME := summer),)
	$(if $(shell [ $(MONTH) -gt 8 ] && [ $(MONTH) -lt 12 ] && echo 1),$(eval THEME := autumn),)
	$(if $(shell echo $$RANDOM | grep -o 1),$(eval THEME=-Ev "winter|spring|summer|autumn|dark"),)
	$(if $(shell defaults read -g AppleInterfaceStyle | grep Dark),$(eval THEME=dark),)
	$(eval THEME ?= winter)
	ls images/ | grep -E "(png|jpg|jpeg|gif)" | grep $(THEME) | grep -v mask.png | sort -R | head -1 | { while read str; do sed -i '~' -E "1,/repeat_x/s:[^/]+.(png|jpg|jpeg|gif):$${str}:" ~/.wezterm.lua; done }

install: unload-service remove-service
	@brew list sleepwatcher > /dev/null 2>&1 || brew install sleepwatcher
	@sed s:__workdir__:$(shell pwd): com.kosmatov.sleepwatcher-wezterm.plist | sudo tee $(PLIST_FILE)
	launchctl load $(PLIST_FILE)

unload-service:
	@launchctl list | grep $(SERVICE) > /dev/null 2>&1 && launchctl unload $(PLIST_FILE) || true

remove-service:
	@launchctl list | grep $(SERVICE) > /dev/null 2>&1 && launchctl remove $(SERVICE) || true

uninstall: unload-service remove-service
	rm $(PLIST_FILE)
