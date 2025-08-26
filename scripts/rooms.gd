class_name Rooms
extends Node

var rooms_location = {
	"Awakening Chamber": {
		"North": "Passage of King's",
		"South": "The Grand Hall",
		"Description": "You wake sprawled upon cold stone, the absolute darkness broken only by moonlight creeping through ancient diamond-paned window.\nTo the north, a door of blackened steel looms like a giant's shield, its serpent-wrought handle cold as winter's heart and utterly immovable.",
		"visited": false
		},
	"The Grand Hall": {
		"North": "Awakening Chamber",
		"South": "The Bone Garden",
		"West" : "Moonlight Gallery",
		"East": "Scullery",
		"Description": "Moonbeams slant through high windows, illuminating dust that dance around the great table of black oak, surrounded by chairs toppled in chaos.\nThree stone sentinels preside over this Grand hall. Their bronze, silver, and gold placards tell of rings gifted to a king who reigns eternal.",
		"visited": false
		},
	"Moonlight Gallery": {
		"North": "The King's Rest",
		"South": "The Royal Armory",
		"West" : "Scriptorium",
		"East": "The Grand Hall",
		"Description": "Silver moonlight light pours through windows that frame the banners that flow through the gallery, portraits whose painted eyes follow your passage.\nMemories of lords and ladies who once walked these halls laid bare.",
		"visited": false
		},

	"The King's Rest" : {
		"South": "Moonlight Gallery",
		"Item": "Golden Ring",
		"Description": "Power emanates from this great chamber where shadows pool like black blood around the throne of the forgotten king.\nRed satin drapes down over the kings headrest. A Golden Ring rests upon its velvet cushion, radiating light so powerful, you cannot look away.",
		"visited": false
		},
	"Scriptorium" : {
		"East": "Moonlight Gallery",
		"West": "Scriptorium",
		"Description" : "Bound leather and parchment of ancient histories lie here: chronicles of the three knights, records of the rings, accounts of a realm's glory.\nQuills rest like the bones of their maester, crumbling with the throne of which they served.",
		"visited": false
		},
	"The Royal Armory": {
		"North": "Moonlight Gallery",
		"Item": "Silver Ring",
		"Description": "Steel in ordered rows where the king's knights once drew their blades, worn shields bearing the heraldry of the forgotten realm.\nA Silver Ring of Sharp Decision gleams. These instruments of royal justice wait perfectly sharp, eternally loyal to masters made of shadow and stone.",
		"visited": false
		},
	"Scullery": {
		"North": "Provision's Vault",
		"South": "Drowner's Winery",
		"West" : "The Grand Hall",
		"East": "Thrall's Quaters",
		"Description": "Copper vessels hang like the organs of gutted beasts, broken stone basins and dusty cutlery inhabit the uneven cobblestone floor.\nRemnants of the once great feasts that honored their liege now rotting for eternity.",
		"visited": false
		},
	"Provision's Vault": {
		"South": "Scullery",
		"Description": "Shelves cradle jars whose contents dissolved into dust, torn sacks and empty crates.\nThe air carries scents of spices that once overflowed, preserving nothing but the echo of abundance.\nHere lie the remnants of prosperity that died with the king, rotten by time and forgotten.",
		"visited": false
		},
	"Thrall's Quaters" : {
		"West": "Scullery",
		"Item": "Brass Ring",
		"Description": "Cots bear the impressions of bodies that once served.\nPersonal effects and torn clothes scattered throughout the dimly lit quarters.\nA brass ring sits beside the dresser, hidden in plain sight.",
		"visited": false
		},
	"Drowner's Winery": {
		"North": "Scullery",
		"Chest": "Locked Chest",
		"Description": "Stained wine weeps from shattered caskets. The air hangs thick with the phantom sweetness of alcohol lingering in wood.\nUpon the far wall stands an iron chest bearing three sullen sockets.nHere, where sovereignty dissolved into spirits, the final key still waits.",
		"Chest_Contents": "king's Key",
		"Chest_Open": false,
		"visited": false
	},
	"Passage of King's": {
		"South": "Awakening Chamber",
		"Description": "You use the Ancient Key and the great steel door swings open. A blast of fresh air hits your face, carrying the scent of damp earth and freedom. You have escaped the Forgotten Manor.",
		"Locked": true,
		"Key": "Ancient Key",
		"Win": true,
		"visited": false
		},
	"The Bone Garden": {
		"North": "The Grand Hall",
		"Item": "Ancient Key",
		"Description": "Hidden beyond the three great statues lies the catacomb that cradles the final resting place of the forgotten king.\nBone and regalia are fused together, his golden circlet grown into his skull. Clutched in his skeletal hand is a large, ornate key.",
		"Locked": true,
		"Key": "king's Key",
		"visited": false
		}
}
