### RedChair - FFXIV AFKer Instructions

Before running the AFKer `[Delete]` please tab into the game,
the run/stop hotkey only works when the game is the active window.

Once its running you can now tab out and use the rest of your PC how you usually would!


Keys that open menus will stop you from getting kicked,
no need to move around or anything, be sure to use multiple 
different keys to avoid detection.

`[F1]` and `[Home]` hotkeys will work when tabbed out.

###### To edit key binds that will be used:
1. Edit through the textbox or create and edit binds.txt (case sensitive) 
   in the same folder as the .exe
2. Enter each key, seperate each one with a space
3. Press Save and Reload button

See list for key names: [tobu.co/redchair](https://tobu.co/redchair)
Want to use a modified button? Place hotkey prefixes before the keybind. See [tobu.co/redchair#modifier](https://tobu.co/redchair)

###### Hotkeys:
`[Delete]` to run or stop the AFKer

`[F1]` to close the program

`[Home]` to reload the program


----------------------------------------------------------


###### What does it do?
RedChair will press a random button from a list of your choice. It has a random press length and presses the button between a random time limit to help make it look less suspicious. After all, pressing the same button, for the same length every exact 10 seconds is pretty obvious indication of a bot 🙃

All simulated key presses are flagged as synthetic on windows, only way to get around it and have key presses look real is to send inputs from a driver using something like [AutoHotInterception](https://github.com/evilC/AutoHotInterception) which has the possibility of soft-locking your PC and requires another keyboard. I'm also not sure its possible to have the key presses run in the background of a specific program like this allows.



###### Known bugs:
Spamming the run/stop toggle will cause the program to hitch.
To fix you must find the program in the system tray to close it.



###### Warning
I am not responsible for anything that might happen to your account when using this. Use at your own risk. This program is in a bit of a grey area in regards to TOS, inputs will be flagged as synthetic but it shouldnt matter as there are many legitimate reasons for synthetic inputs such as disibility or things like Razer Synapse (only way to make key presses look truly real is to use something like AutoHotInterception that sends inputs from a driver, but that also has its own downsides). You most likely wont get banned for using this but it is always a possibility when you are automating things.
