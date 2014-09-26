import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Custom PP determines what is being written to xmobar
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for xmobar
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    , startupHook = myStartupHook
    }
    `additionalKeysP`
    [ ("M-<F12>",  spawn "xscreensaver-command -lock")
    , ("<XF86MonBrightnessUp>",   spawn "xbacklight +5")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -5")
    -- For post kb hotplug...
    , ("M-<F11>", spawn "setxkbmap gb && xmodmap /home/scott/.Xmodmap")
    ]

myTerminal    = "urxvtc"
myModMask     = mod4Mask
myBorderWidth = 1
myBar         = "xmobar"

myStartupHook :: X()
myStartupHook =
  spawnOnce "/home/scott/bin/tmux_ide.sh"
