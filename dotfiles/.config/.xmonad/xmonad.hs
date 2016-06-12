--
-- xmonad example config file for xmonad-0.9
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
-- NOTE: Those updating from earlier xmonad versions, who use
-- EwmhDesktops, safeSpawn, WindowGo, or the simple-status-bar
-- setup functions (dzen, xmobar) probably need to change
-- xmonad.hs, please see the notes below, or the following
-- link for more details:
--
-- http://www.haskell.org/haskellwiki/Xmonad/Notable_changes_since_0.8
--
 
import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Dishes
import XMonad.Layout.ResizableTile
import XMonad.Actions.GridSelect
import XMonad.Layout.WindowNavigation
import XMonad.Layout.PerWorkspace
import XMonad.Layout.IM
import XMonad.Layout.Reflect
import XMonad.Layout.ThreeColumns
import XMonad.Actions.WindowMenu
import XMonad.Layout.StackTile
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Layout.Grid
import XMonad.Actions.WindowBringer
import XMonad.Layout.SubLayouts
import XMonad.Prompt
import XMonad.Prompt.Shell


 
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
 
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "lxterminal"
 
-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False
 
-- Width of the window border in pixels.
--
myBorderWidth   = 2
 
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask
 
-- NOTE: from 0.9.1 on numlock mask is set automatically. The numlockMask
-- setting should be removed from configs.
--
-- You can safely remove this even on earlier xmonad versions unless you
-- need to set it to something other than the default mod2Mask, (e.g. OSX).
--
-- The mask for the numlock key. Numlock status is "masked" from the
-- current modifier status, so the keybindings will work with numlock on or
-- off. You may need to change this on some systems.
--
-- You can find the numlock modifier by running "xmodmap" and looking for a
-- modifier with Num_Lock bound to it:
--
-- > $ xmodmap | grep Num
-- > mod2        Num_Lock (0x4d)
--
-- Set numlockMask = 0 if you don't have a numlock key, or want to treat
-- numlock status separately.
--
-- myNumlockMask   = mod2Mask -- deprecated in xmonad-0.9.1
------------------------------------------------------------
 
 
-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["1:web","2:latex","3:media","4:math","5:image","6:im","7","8","9"]
 
-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#C40000"
 
------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    
    -- launch the prompt
    , ((modm .|. shiftMask, xK_z), shellPrompt defaultXPConfig)
    
    -- launch dmenu
    , ((modm,               xK_p     ), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
    -- toggle dock gap
    ,((modm, xK_b     ), sendMessage ToggleStruts)
	 
    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- launch gmrun
    , ((modm .|. shiftMask, xK_f     ), spawn "rootnaut")

    -- launch dolphin
    , ((modm, xK_f     ), spawn "dolphin")

    -- launch vifm
    , ((modm .|. shiftMask, xK_f     ), spawn "lxterminal -e vifm")  
    
    -- launch firefox
    , ((0, 0x1008ff18     ), spawn "firefox")
      
    -- launch calendar
    , ((0, 0x1008ff19     ), spawn "orage --toggle")
    
    -- launch galculator
    , ((0, 0x1008ff1d     ), spawn "qalculate-gtk")
    
    -- close focused window
    , ((modm, xK_x     ), kill)
 
     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
 
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
 
    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
 
    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
 
    -- Move focus to the next window
    , ((modm,               xK_s     ), windows W.focusDown)

     -- XF86AudioMuteC1BDB5
    , ((0 , 0x1008ff12), spawn "amixer -q set PCM toggle")
    -- XF86AudioLowerVolume
    , ((0 , 0x1008ff11), spawn "amixer -q set PCM 10- unmute")
    -- XF86AudioRaiseVolume
    , ((0 , 0x1008ff13), spawn "amixer -q set PCM 10+ unmute")
  
     --Screenshot region upload
         , ((0 ,  0xff61), spawn "xfce4-screenshooter -r -u")

    -- Gridselect
    , ((modm, xK_u), gotoMenu)

    -- Bringselected
    , ((modm .|. shiftMask, xK_u), bringMenu)

    -- Move focus to the previous window
    , ((modm,               xK_t     ), windows W.focusUp  )
 
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
 
    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)
 
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_s     ), windows W.swapDown  )
 
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_t     ), windows W.swapUp    )
 
    -- Shrink the master area
    , ((modm,               xK_g     ), sendMessage Shrink)
 
    -- Expand the master area
    , ((modm,               xK_d     ), sendMessage Expand)
    
    -- Shrink Window 	
    , ((modm,               xK_h), sendMessage MirrorShrink)
    
    -- Expand Window
     , ((modm,               xK_l), sendMessage MirrorExpand)

 
    -- Push window back into tiling
    , ((modm,               xK_a     ), withFocused $ windows . W.sink)
 
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
 
    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    
    -- WindowNavigation
    , ((modm,                 xK_Right), sendMessage $ Go R)
    , ((modm,                 xK_Left ), sendMessage $ Go L)
    , ((modm,                 xK_Up   ), sendMessage $ Go U)
    , ((modm,                 xK_Down ), sendMessage $ Go D)
    , ((modm .|. controlMask, xK_Right), sendMessage $ Swap R)
    , ((modm .|. controlMask, xK_Left ), sendMessage $ Swap L)
    , ((modm .|. controlMask, xK_Up   ), sendMessage $ Swap U)
    , ((modm .|. controlMask, xK_Down ), sendMessage $ Swap D)
  
    -- WindowMenu
    , ((modm,               xK_o ), windowMenu)

    -- Maximize
    , ((modm, xK_y), withFocused (sendMessage . maximizeRestore))

    -- Minimize
        , ((modm,               xK_i     ), withFocused (\f -> sendMessage (MinimizeWin f)))
        , ((modm .|. shiftMask, xK_i     ), sendMessage RestoreNextMinimizedWin)

--key bindings for sublayout
       , ((modm .|. controlMask, xK_h), sendMessage $ pullGroup L)
       , ((modm .|. controlMask, xK_l), sendMessage $ pullGroup R)
       , ((modm .|. controlMask, xK_k), sendMessage $ pullGroup U)
       , ((modm .|. controlMask, xK_j), sendMessage $ pullGroup D)
       , ((modm .|. controlMask, xK_m), withFocused (sendMessage . MergeAll))
       , ((modm .|. controlMask, xK_u), withFocused (sendMessage . UnMerge))
       , ((modm .|. controlMask, xK_period), onGroup W.focusUp')
       , ((modm .|. controlMask, xK_comma), onGroup W.focusDown')
 
    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
 
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
 
    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
 
    --
    -- mod-[1..9], Switch to workspace N
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_F1 .. xK_F9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
 
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
 

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
 
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
 
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
 
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
 
------------------------------------------------------------------------
-- Layouts:
 
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- * NOTE: XMonad.Hooks.EwmhDesktops users must remove the obsolete
-- ewmhDesktopsLayout modifier from layoutHook. It no longer exists.
-- Instead use the 'ewmh' function from that module to modify your
-- defaultConfig as a whole. (See also logHook, handleEventHook, and
-- startupHook ewmh notes.)
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout =  avoidStruts $ subTabbed $ onWorkspace "5:image" gimpLayout $ windowNavigation $ smartBorders $ (standardLayouts) 
  where
     -- List of layouts to use.
     standardLayouts =  maximize $ minimize (ResizableTall 1 (3/100) (1/2) [] ||| Dishes 2 (1/3) ||| Grid ||| Full ||| ThreeCol 1 (3/100) (1/2) ||| StackTile 1 (3/100) (1/2))
     -- Layout for the GIMP:
     -- Uses the left and right edge of the screen for GIMP's toolboxes (if
     -- they are present). Apart from that, the usual layouts can be used.
     gimpLayout = withIM (0.11) (Role "gimp-toolbox") $
         reflectHoriz $
         withIM (0.15) (Role "gimp-dock") standardLayouts
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100






------------------------------------------------------------------------
-- Window rules:
 
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll 
    [ className =? "Synapse"        --> doFloat
    , className =? "Qalculate-gtk"        --> doFloat
    , className =? "Guake.py"        --> doFloat
    , isFullscreen --> doFullFloat
    , className =? "File-roller"        --> doFloat
    , className =? "Gretl_x11"        --> doShift "4:math"
    , className =? "Pidgin"           --> doShift "6:im"
    , className =? "Vlc"           --> doShift "3:media"
    , className =? "Wine"           --> doShift "3:media"
    , className =? "Firefox"           --> doShift "1:web"
    , className =? "Kate"           --> doShift "2:latex"
    , className =? "Gummi"           --> doShift "2:latex"
    , className =? "Chromium-browser"           --> doShift "1:web"
    , className =? "Gloobus-preview"           --> doFloat
    , className =? "Vlc"           --> doFloat
    , className =? "Gimp-2.6" --> doShift "5:image"
    , className =? "Darktable" --> doShift "5:image"
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]
 <+> manageDocks
------------------------------------------------------------------------
-- Event handling
 
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH event handling to your custom event hooks by
-- combining them with ewmhDesktopsEventHook.
--
myEventHook = mempty
 
------------------------------------------------------------------------
-- Status bars and logging
 
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH logHook actions to your custom log hook by
-- combining it with ewmhDesktopsLogHook.
--
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook
 
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add initialization of EWMH support to your custom startup
-- hook by combining it with ewmhDesktopsStartup.
--
myStartupHook = do
      spawn "synapse"
      spawn "trayer  --tint 0x302F2F --SetDockType true --SetPartialStrut true --edge top --align right --widthtype pixel --width 167 --heighttype pixel --height 6 --distance -1 --transparent true --alpha 0"
      spawn "indicator-usb"
      spawn "gtk-redshift -l 48.5:7.7"
      spawn "conky"
      spawn "bluetooth-applet"
      spawn "xcompmgr -CfF"
      spawn "jupiter.exe"
      spawn "feh --bg-center /home/cbrunos/Pictures/gWeHv.jpg"
      spawn "xfce4-power-manager"
      spawn "synaptiks"
      spawn "clipit"
      spawn "xscreensaver -no-splash"
      spawn "lookit"
      spawn "unclutter -idle 5"
      spawn "volti"
      spawn "nm-applet"
      setWMName "LG3D"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
 
-- Run xmonad with the settings you specify. No need to modify this.
--
main = xmonad=<< xmobar defaults
 
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = defaultConfig {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        -- numlockMask deprecated in 0.9.1
        -- numlockMask        = myNumlockMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
 
      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
 
      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }
