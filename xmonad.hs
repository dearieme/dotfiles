import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce

main :: IO ()
main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey myConfig

-- Custom PP determines what is being written to xmobar
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for xmobar
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig
    { terminal    = "kitty"
    , modMask     = mod4Mask
    , borderWidth = 1
    , startupHook = spawnOnce "/home/scott/bin/tmux_ide.sh"
    }
    `additionalKeysP`
    [ ("M-<F12>",                 spawn "xscreensaver-command -lock")
    , ("<XF86MonBrightnessUp>",   spawn "xbacklight +5")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -5")
    -- For post kb hotplug...
    , ("M-<F11>", spawn "setxkbmap gb && xmodmap /home/scott/.Xmodmap")
    -- Audio keys
    , ("M-<F4>", spawn "/usr/bin/pulseaudio-ctl mute-input")
    , ("M-<F3>", spawn "/usr/bin/pulseaudio-ctl up")
    , ("M-<F2>", spawn "/usr/bin/pulseaudio-ctl down")
    , ("M-<F1>", spawn "/usr/bin/pulseaudio-ctl mute")
    ]

