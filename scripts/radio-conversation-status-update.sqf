//radio-conversation-status-update.sqf

sleep (random 25);

waitUntil {sleep 5; EVERYBODY_IS_DONE_TALKING};
EVERYBODY_IS_DONE_TALKING = false;

player sideChat "Delta Actual, this is Delta One, come in, over.";
sleep (7+random 2);

THE_CO sideChat "Go ahead, One.";
sleep (4+random 2);

player sideChat "I have good news and bad news.";
sleep 5;

THE_CO sideChat "Allright, start with the bad news then.";
sleep 6;

player sideChat "The helicopter is out for the moment. It started losing fuel all of a sudden, and I just managed to put her down at the rebel camp north of Gori.";
sleep 16;

THE_CO sideChat "Well that could have ended a lot worse. So what's your good news?";
sleep 7;

player sideChat "Commander Kostas gave us some fresh intel about a possible location where our guy is being held. We are on our way now to check it out.";
sleep (12+random 2);

THE_CO sideChat "Good work, One. Be careful out there.";
sleep (4+random 2);

player sideChat "Will do, Captain. Delta One, out.";
sleep (2+random 2);


EVERYBODY_IS_DONE_TALKING = true;

