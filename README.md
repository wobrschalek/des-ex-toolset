# DesEx Toolset
This toolset is intended to provide design space exploration capabilities for the spacecraft domain when using MBSE. 
Its use is further detailed in its companion paper, available here: https://ieeexplore.ieee.org/document/10116019
## MBSE Environment
The toolset is designed for SysML and to be used with Cameo Systems Modeller (now called Magic Sytems of Sytems Architect). MATLAB is nessecary for storing 
and visualising design space data and STK provides orbital co-simulation.
## Components
The toolset contains a template project, including a profile of stereotypes for parameter variability modelling, workflow 
diagrams for executing design space explorations and MATLAB based interface for co-simulation in STK.

## Example Models and Demonstrations
Demonstrations of the toolset capabilites may be found in the examples folder and include:
 -  A very simple parametric model of the Rastrigin Function in 2 dimensions complete with design space exploration implemented for two design variables and one design constraint
 - A simple Earth observation spacecraft model with orbital predicitons (supplied by STK) and design space exploration of orbital parameters

## Setup
The following steps should be followed in order to use the toolset:
 - Connect MATLAB to Cameo /MSOSA
 - "Use" desEx Toolset project
 - set working directory