# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()


c.tabs.position = "left"
c.url.start_pages = ["https://searx.me", "https://mail.protonmail.com/login"]
#c.url.searchengines = {'se':"https://searx.me/?q={}"}
c.hints.chars = "ctsrn"

config.bind('J', 'set-cmd-text :open {url}')
config.bind('j', 'set-cmd-text -s :open -t ')


config.bind('v', 'tab-prev')
config.bind('l', 'tab-next')
config.bind('gq', 'back')
config.bind('gh', 'forward')

config.bind('c', 'scroll left')
config.bind('t', 'scroll down')
config.bind('s', 'scroll up')
config.bind('T', 'scroll-page 0 0.5')
config.bind('S', 'scroll-page 0. 0.5')
config.bind('r', 'scroll right')

config.bind('C', 'enter-mode caret')

config.bind('alt-"', 'tab-focus 1')
config.bind('alt-«', 'tab-focus 2')
config.bind('alt-»', 'tab-focus 3')
config.bind('alt-()', 'tab-focus 4')
config.bind('alt-)', 'tab-focus 5')
config.bind('alt-@', 'tab-focus 6')
config.bind('alt-+', 'tab-focus 7')
config.bind('alt--', 'tab-focus 8')
config.bind('alt-/', 'tab-focus 9')

config.bind('<Ctrl-v>', 'spawn mpv {url}')

config.bind('M', 'quickmark-save')