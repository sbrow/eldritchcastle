-- ToME - Tales of Middle-Earth
-- Copyright (C) 2009, 2010, 2011, 2012, 2013 Nicolas Casalini
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

-- This file loads the game module, and loads data
local KeyBind = require "engine.KeyBind"
local DamageType = require "engine.DamageType"
local ActorStats = require "engine.interface.ActorStats"
local ActorResource = require "engine.interface.ActorResource"
local ActorTalents = require "engine.interface.ActorTalents"
local ActorAI = require "engine.interface.ActorAI"
local ActorLevel = require "engine.interface.ActorLevel"
local ActorTemporaryEffects = require "engine.interface.ActorTemporaryEffects"
local ActorInventory = require "engine.interface.ActorInventory"
local Birther = require "engine.Birther"

dofile("/mod/resolvers.lua")

-- Useful keybinds
KeyBind:load("move,hotkeys,inventory,actions,interface,debug")

-- Damage types
DamageType:loadDefinition("/data/damage_types.lua")

-- Talents
ActorTalents:loadDefinition("/data/talents.lua")

-- Timed Effects
ActorTemporaryEffects:loadDefinition("/data/timed_effects.lua")

-- Actor resources
ActorResource:defineResource("Sanity", "sanity", nil, "sanity_regen", "Sanity represents your character's mental state.")
ActorResource:defineResource("Action Points", "actions", nil, "actions_regen", "AP represent the actions that can be taken each turn.")

-- Actor stats
ActorStats:defineStat("Physical", 	"con", 10, 1, 100, "Defines the physical constitution of the character.")
ActorStats:defineStat("Mental", 	"men", 10, 1, 100, "Defines the mental constitution of the character.")
ActorStats:defineStat("Perception", "per", 10, 1, 100, "Defines the character's awareness.")
ActorStats:defineStat("Luck",		"lck", 10, 1, 100, "Luckiness")

--Actor inventory
ActorInventory:defineInventory("INVEN", "Inventory", false, "The character's inventory.")
ActorInventory:defineInventory("HAND", "Weapon used", true, "The weapon the character is currently wielding.")
ActorInventory:defineInventory("BODY", "Item worn", true, "The item the character is currently wearing.")
ActorInventory:defineInventory("ITEM", "Special item", true, "The special item the character is holding.")

-- Actor AIs
ActorAI:loadDefinition("/engine/ai/")

-- Birther descriptor
Birther:loadDefinition("/data/birth/descriptors.lua")

return {require "mod.class.Game" }