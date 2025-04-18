# Pulse Pursuit
This is a project with SUTD 50.002 where we set out to build a game using FPGA.

## FSM and Datapath
![Datapath](./sources/CompStruct%20Datapath(3).png)
![FSM](./sources/statemachine%20test(4).png)


## Game Idea
The game is about a digitalized reaction-based tug-of-war. Where there would be 2 players fighting against one another, each with 2 buttons on their side. When one of the button lights up, the first player to hit the correct button would have the flag (on the rope) move towards their side. More information can be found [here](./sources/compstruct.pdf)

## How to run the game
1. Download Alchitry Lab
2. Import the folder `CompStruct_1D` into Alchitry Lab
3. Press build then flash

## Modular Design
For the code to stay modular, before implementing any new modules, I first test the code out thoroughly within `test_module` folder. All of the code here is tested to work, to ensure that every module is working as intended and if there is a bug, it would be easier to isolate the module that I suspect to be the culprit.

## Custom Debugger
As debugging within FPGA is a hassle, I created a custom debugger that can be found in both `test_module` -> `project_debugger` and `CompStruct_1D` -> `source` -> `debugger.luc`.

What I did was that I used serial communication (rx/tx) to print the output of my registers (DFFs) and some of the outputs. I use these output to check if
- my code is the problem
- the circuit connection is the issue