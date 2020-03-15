# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow pdf.js to view PDF files in the browser. Note that the files can
# still be downloaded by clicking the download button in the pdf.js
# viewer.
# Type: Bool
c.content.pdfjs = True

# List of user stylesheet filenames to use.
# Type: List of File, or File
c.content.user_stylesheets = '~/Documents/config_files/solarized-all-sites-dark.css'

# Where to show the downloaded files.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.downloads.position = 'bottom'

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined: * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['urxvt-256color', '-e', 'nvim', '{}']

# Characters used for hint strings.
# Type: UniqueCharString
c.hints.chars = 'ctsrn'

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'left'

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://searx.be/?q={}'}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = ['https://searx.be']

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = '#93a1a1'

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#002b36'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#002b36'

# Color gradient start for download text.
# Type: QtColor
c.colors.downloads.start.fg = '#93a1a1'

# Color gradient start for download backgrounds.
# Type: QtColor
c.colors.downloads.start.bg = '#002b36'

# Color gradient end for download text.
# Type: QtColor
c.colors.downloads.stop.fg = '#002b36'

# Color gradient stop for download backgrounds.
# Type: QtColor
c.colors.downloads.stop.bg = '#93a1a1'

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = '#eee8d5'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#002b36'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#859900'

# Background color of the tab bar.
# Type: QtColor
c.colors.tabs.bar.bg = '#002b36'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = '#93a1a1'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#002b36'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = '#002b36'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#93a1a1'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#d33682'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#d33682'

# Background color for webpages if unset (or empty to use the theme's
# color).
# Type: QtColor
c.colors.webpage.bg = '#586e75'

# Default monospace fonts. Whenever "monospace" is used in a font
# setting, it's replaced with the fonts listed here.
# Type: Font
#c.fonts.monospace = 'Ubuntu Sans'

# Font family for standard fonts.
# Type: FontFamily
c.fonts.web.family.standard = 'Ubuntu'

# Font family for fixed fonts.
# Type: FontFamily
c.fonts.web.family.fixed = 'Ubuntu'

# Font family for sans-serif fonts.
# Type: FontFamily
c.fonts.web.family.sans_serif = 'Ubuntu'

# Bindings for normal mode
config.bind('<Alt+">', 'tab-focus 1')
config.bind('<Alt+(>', 'tab-focus 4')
config.bind('<Alt+)>', 'tab-focus 5')
config.bind('<Alt++>', 'tab-focus 7')
config.bind('<Alt+->', 'tab-focus 8')
config.bind('<Alt+/>', 'tab-focus 9')
config.bind('<Alt+@>', 'tab-focus 6')
config.bind('<Alt+«>', 'tab-focus 2')
config.bind('<Alt+»>', 'tab-focus 3')
config.bind('<Ctrl+v>', 'spawn mpv {url}')
config.bind('C', 'enter-mode caret')
config.bind('J', 'set-cmd-text :open {url}')
config.bind('M', 'quickmark-save')
config.bind('S', 'scroll-page 0 -0.5')
config.bind('T', 'scroll-page 0 0.5')
config.bind('V', 'enter-mode passthrough')
config.bind('b', 'buffer')
config.bind('c', 'scroll left')
config.bind('gh', 'forward')
config.bind('gq', 'back')
config.bind('j', 'set-cmd-text -s :open -t ')
config.bind('l', 'tab-next')
config.bind('r', 'scroll right')
config.bind('s', 'scroll up')
config.bind('t', 'scroll down')
config.bind('v', 'tab-prev')
