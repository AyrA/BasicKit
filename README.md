# BasicKit

Factorio mod for the 'no-crafting' challenge

# What it does

This mod makes factorio a lot more difficult.
It gives you the absolute minimum items you need to craft
everything and disables manual crafting completely.

This means you get these Items:

- Solar panel
- Power pole
- Assembling machine (type 3)

## Solar panel

A solar panel generates 60 Kw of power during the day.
This is barely enough to keep the assembling machine running.
The player does not gets steam energy,
because this would require at least 3 items (engine, boiler, pump),
also it makes much more energy and works during the night.
Getting steam energy running is not difficult.
The solar panel can be replaced with a steam engine, boiler and offshore pump in the mod settings.

## Power pole

The power pole is needed, because it's the only way for electricity to flow.
Directly placing a machine next to a panel or a steam engine does nothing.

## Assembling machine (type 3)

The type 3 of this device is the only one, capable of having 5 input slots.

### Reason why type 3 is necessary

To get this machine, you need blue science packs, to get blue science packs,
you need advanced circuits, advanced circuits require plastic.
Plastic is made from petroleum, which is made in a refinery.
A refinery requires 5 different items to craft.
To automatically craft a recipe with this many source items
you need the type 3 assembling machine.
To get the type 3 machine in a 'no crafting' challenge,
you need a type 3 machine.

# Configuration

The mod can be configured in the Mod Settings UI of Factorio.
No modification to the source files is necessary anymore.

## settings.lua

Contains the settings for the Mod Settings UI

## control.lua

Constants in control.lua enable certain items.
The value is obtained from the settings

### Add Iron ore

This adds 4 iron ore items into the players inventory.
This is just enough to craft the first pickaxe.
Mining a single iron ore takes about 20 seconds without a pickaxe.
This greatly speeds up the bootstrap phase.

### Add Pickaxe

Gives the player a pickaxe to start with.
Without the pickaxe, the player has to mine 4 iron ores.
If the axe is too much, the `ADD_ORE` option can be used instead.

This is on by default.

### Use Steam Engines

Setting this to true, gives a steam engine,
boiler and pump to the player instead of solar.

### Add basic items

Gives the player a stone furnace and a burner mining drill.
These items are usually removed to add a small amount of difficulty.

### Add accumulator

Gives the player an accumulator.
The assembling machine already drains 7 Kw when it does not works.
When crafting stuff, a solar panel can't keep up with the energy requirement by far.
The accumulator allows to bridge that gap and also allows crafting at night.

## data-final-fixes.lua

This file makes all items machine-craftable only.

# Overrides
To override a certain recipe of your mod to be available ffor hand crafting,
give it the category `ayras-no-crafting-challenge`
