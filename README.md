# matworkbench
The matworkbench is an interface between Connectome Workbench and Matlab. Many neuroscience studies are using SPM for analyzing the data but it is somtimes difficult to regenerate the figures in the form that has been published. Connectome Workbench has the ability to store all the data in a nice form. However it is difficult to use it for other softwares like SPM. Here I created a very small script which bridges the Matlab and Connectome Workbench to help scientists to visulaize the results in the Connectome Workbench very quickly .

Prerequisites:

1) SPM12

2) Connectome Workbench

The current version has been tested in Linux and Mac

if you are using Mac specially you have to run Matlab via terminal t access the wb_view.
The path to wb_view and Matlab also must be defined in the profile file. 

Usage:

clone ...

% run in Matlab

addpath  Path/matworkbench

opennii

