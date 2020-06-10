# Screens

The following screens are used in the app.

A screen is a higher-order Widget uses other components and widgets, and will usually be found within the routes of a `WidgetsApp` / `MaterialApp`.

# Splash Screen

A simple splash screen in the beginning to enforce branding, but also serves as beautiful *pause* while the dataset loads.

# Tournament Screen

- A **Navigation Item**
- A simple screen that shows the rounds, the series, and the teams within those serieses
- Clicking on any team Icon will bring up the **Team Screen**.
- Clicking on any series will bring up a **Series Screen**.

# Highlights Screen

- A **Navigation Item**
- A list representation of games across all serieses, including past serieses from past rounds, in descending chronological order (most recent at top)
- This is a like a "Tournament Overview", or "Around the league", which provides a bird's eye view of the whole tournament

# Team Screen

- A screen that shows the Team Icon, name, venue, and various other stats
- Past games can be viewed and clicked here. **Game Screen**

# Series Screen

- Essentially a **Highlights Screen** but refined to display only games in that series.
- Clicking

## Generic Screens

## GameListScreen
- A generic Widget that displays games in a list format

## GameScreen
- A generic Widget that displays the details of a specific game

## TournamentScreen
- A widget that displays tournament brackets

## TeamScreen
- A generic Widget that displays the details of a specific team

