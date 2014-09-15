import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig

-- The main function
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    }
    `additionalKeysP`
    [ ("M-<F12>",  spawn "xscreensaver-command -lock")
    , ("<XF86MonBrightnessUp>", spawn "xbacklight +5")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -5")
    ]

myTerminal    = "urxvtc"
myModMask     = mod4Mask
myBorderWidth = 1
