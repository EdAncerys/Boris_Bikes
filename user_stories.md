
## Domain Model 1

| Object  | Messages  |   
|---|---|
| Person  |  |
|  Bike | working? |
| DockingStation | release_bike |

## User Model interaction diagram  

> Bike <-- working? --> true/false

> DockingStation <-- release_bike --> a Bike

## Domain Model 2

| Object  | Messages  |   
|---|---|---|---|---|
| Person  |  |
|  Bike | dock |
|  Docking station | is_empty? |
