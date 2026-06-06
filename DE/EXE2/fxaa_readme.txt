
		        	     FXAA Tool
	            COPYRIGHT 2011, 2012©, Joerg Baermann (Violator)

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
    	the Free Software Foundation, either version 3 of the License, or
    	(at your option) any later version.

    	This program is distributed in the hope that it will be useful,
    	but WITHOUT ANY WARRANTY; without even the implied warranty of
    	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    	GNU General Public License for more details.

    	You should have received a copy of the GNU General Public License
    	along with this program.  If not, see <http://www.gnu.org/licenses/>.

		           	        
			      Based on NVIDIA FXAA
	COPYRIGHT (C) 2010, 2011 NVIDIA CORPORATION. ALL RIGHTS RESERVED
	
		                           
		 Credits to all contributers at the bottom of this file!



IMPORTANT: FXAA.s3db contains all your custom game settings.
Always make a backup of that file before upgrading to a new version of this tool!

Check @ assembla.com for source code, updates, info, bug submission and feature requests.

http://www.assembla.com/spaces/fxaa-pp-inject/

This version is for Directx 8 and 9

*May be incompatible with any other form of antialiasing.
**Can be combined with downsampling.

-----------------------------
WARNING: 

Do not use this tool while playing on anti cheat enabled servers (may be detected as a cheating measure)!
Although, there has been no reports of people who got banned for using FXAA Tool so far.
-----------------------------
Install: 

Place the FXAA Tool folder anywhere you like and add the game executables path via the tools menu.
-----------------------------
Uninstall: 

Delete the files.
-----------------------------
Important:

Install the latest DirectX runtime.
----------------------------- 
How to adjust:

Start FXAA_Tool.exe and you are good to go.
-----------------------------
Troubleshooting:

A "log.log" file is created to log behaviour/ bugs. Look inside to get additional information.
If the "log.log" file is not created then you are using the wrong "*.dll" or you put it into the wrong directory.
If the "log.log" is created but the game crashes or FXAA is disabled, look where the "log.log" is created.
Usually the shader files and folders go into that particular directory.
Try to put the files and folders into different directories before saying it doesn't work.
 
In some games (e.g. Portal 1 or Halo 1) refuse to accept the alpha channel. 
A general workaround (lower quality) for those is to add the following line at the beginning of shader.fx : #define FXAA_GREEN_AS_LUMA 1
There is a way to experiment with sharpening/custom shaders. 
I added an example. To activate additional sharpening filter change edit the line "//Replace this line with #include "Sharpen.h" to add a sharpening pass" in shader.fx.
Note that right now sharpening is only an example that it can be done. 
I more-or-less copypasted a random sharpen filter to show how my mod can be modded.
Compilerlogs for custom shaders are written to "log.log".

-----------------------------
Keys:

PAUSE : Enable/Disable all shaders
PRINT SCREEN : Screenshot 
(Usage of an external application for screenshots is recommended, a lot of games have Print Screen hardcoded, and that will not deliver a post processed result)

*********************************************
NVIDIA FXAA 3.11 is created by TIMOTHY LOTTES
*********************************************

Injection mod orignates from www.3dcenter.org

-----------------------------
Injection method provided by: 

HAANDI
[some dude]

-----------------------------
Code added and aranged by:

BeetleatWar1977
[DKT70]
fpedace
CeeJay.dk
The MPCHC team
Hawthorne
Violator
----------------------------
A special thanks to Guru3D.com and Overclock.net for the recognition of this tool.

Big thanks to all the people testing and giving feedback on this. :)