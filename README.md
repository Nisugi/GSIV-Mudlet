# GSIV-Mudlet
Cleaning up the game feed to strip the xml out and parse the data for UI elements.

Requires Lich to login currently.

Use connection instructions at https://github.com/elanthia-online/lich-5/wiki/Lich-and-Mudlet-for-playing-Gemstone-Dragonrealms-with-a-screen-reader


Seperated out the scripts. Will get a package created later this evening after I get the rest of the scripts refactored and uploaded.




Using the Lich GUI Launcher to start Mudlet.

First you need to start up Mudlet and create a profile. 
Name the profile as your character name capitalized. IE: Nisugi
Open up the scripts editor in Mudlet and add script.
Name it LichConnect.
Put the contents of LichConnect.lua where it says to add your Lua code.
Save Script. Save Profile. Exit Mudlet.


Launch lich.rbw to get the Login Manager and do a manual entry.

Enable the Custom Launch Command box and enter the command:
mudlet --profile=Nisugi

Enter the working directory which is where Mudlet's .exe resides:
C:\Users\shawn\AppData\Local\Mudlet

Enter your username and password, login, select your character and hit Play.

NOTE: When you're in Mudlet's editor, script, trigger, whatever. When you click on one of the scripts to look at it. It reloads it. So clicking on this script in the editor will disconnect you if you are connected as it tries to reconnect. Investigating a solution.
