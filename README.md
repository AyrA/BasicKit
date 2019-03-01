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
The value is obtained from the settings.

**As of 2.0.0, "Keep Inventory" is on by default**

### Use Steam Engines

Setting this to true, gives a steam engine,
boiler and pump to the player instead of solar.

### Don't clear Inventory

This stops the mod from clearing the entire Inventory before giving the mod specific items.
Useful to keep the basic starting items and if other mods want to add stuff that this mod would remove instantly.

This is enabled by default since `v2.0.0`.
Do not disable if a mod adds items to your inventory that are unobtainable.

### Add accumulator

Gives the player an accumulator.
The assembling machine already drains 7 Kw when it does not works.
When crafting stuff, a solar panel can't keep up with the energy requirement by far.
The accumulator allows to bridge that gap and also allows crafting at night.

## data.lua and data-final-fixes.lua

These files make all items machine-craftable only.

# For Mod Developers

To override a certain recipe of your mod to be available for hand crafting,
give it the category `ayras-no-crafting-challenge`
