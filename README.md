jeremylinstats
===============
For lack of a better name, this was what the folder was called when I created this script.

Basically a simple scraper of ESPN game data, mainly shots made/missed by Jeremy Lin.

To run type ./grab_shots.rb from the command line.

What this script does:
----------------------
1.  Grabs Knicks regular season data
2.  For all games that started after Feb 4th (Jeremy Lin's first game),
    start recording opponent, result, scores as well as grab the game_id
    associated with the game for reference.
3.  Grab specialized "shot" data. Which is a json file that ESPN uses to show
    shots made/attempted during a game.
4.  Outputs a output.json, shots.json and shots.js file.

    **output.json**: is the full output of the data that is grabbed.

    **shots.json**: contains only the data needed to display shots made/attempted in an image

    **shots.js**: contains the same data as shots.json but allows you to import the data into for display/processing on a website

There is also an accompanying HTML file (index.html) that uses Raphael to generate a nice shots made/missed graph

BTW I am using this for my own personal use. If you are planning to use stats data commercially it's probably best to talk to a company about licensing the data rather than trying to scrap the data like this script does.

And while sports data is considered, "facts" in the US and thus not copyrightable, this may not be true outside the US. Since this data is hosted on ESPN's website, they will shut down people who use their results for data.

What I'm trying to say is, feel free to use this as long as you understand the consequences.

Good discussion on HN from around 1.5 years ago talking about where to acquire legal sports data: http://news.ycombinator.com/item?id=1791588

I think that's it...

License
------------
Copyright (c) 2012, Shuan Wang.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the organization nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
