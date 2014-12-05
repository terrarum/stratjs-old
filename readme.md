# Game Design Document

XCOMJS is a very basic XCOM-style game written for the browser.

## Description

The map will be a fixed size. There will be two teams: the Player team and the AI team. Teams will spawn on opposite sides of the map.

Maps will have impassable obstacles. Enemy Entities will not be visible through these obstacles.

Entities will have
* Attack Range
* Movement Range
* View Range

## Turns

The game starts with the Players turn.
Once the Player has made all of their moves, the AI turn begins.

Each unit can perform one of the following actions per turn:
* Move
* Attack
* Overwatch

# Things to Figure Out

Fog of War

# Flow

Game starts
Map is loaded
All entities are created
Entities call their spawn function
Player turn


# Things Learned

Store map data in a two-dimensional array.

    mapdata = [
        [col, col, col], // row
        [col, col, col], // row
        [col, col, col]  // row
    ]

Process map by row, then by column.

All entities in the world should be in a single array.

* Generic entity object
* Entities should have
** Team.
** Spawn function (dictates how unit spawns, e.g. team1 on team1 spawn area, team2 could be random, support drone near assault robot, etc.).
** Type (sniper, assault etc).
** Move function.
** Attack function.
** Some kind of logic that dictates whether the unit should move or attack, called by update function.

Grid should have a data model and a DOM element to draw it.
Entities should have a data model and a DOM element to draw it.
The model should have a reference to its element.
The element should have a reference to its model.

A grid cell should have a reference to any entities on it.
An entity should have a reference to the grid cell that it is on.

When an entity moves, it must first clear the grid cell it is on of its reference to the entity.
* That should be easy; clear before setting a new location.

