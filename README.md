# Experimental Data for the Experimental Modeling of Water-Wave Interactions with a Flexible Beam

This GitHub repository has been created to share the experimental data which is presented in the OMAE 2023 conference paper 'Experimental Modeling of Water-Wave Interactions with a Flexible Beam'. The paper presents a series of fluid-structure-interaction (FSI) experiments for studying water-wave interactions with a flexible beam in a wide range of sea conditions thus yielding a variety of FSI test-case data. A deatiled CAD model of the beam and arrangements of the sensors are described in **CAD_fsi_beam_exp.pdf**. The aim is to use these experimental data in order to validate FSI solvers commonly employed by the maritime industry in the design of fixed-foundation, offshore wind turbines.

The study is divided into three experimental cases which are as follows (click on case number to read more description):

<details>

<summary>Case-1 experiments: interactions of regular waves with the flexible beam when the carriage is at rest </summary>

- Experimental Case 1 concerns interactions of regular waves with the flexible beam when the carriage is at rest; studying this case will facilitate the validation of linear FSI solvers in the non-resonant regime, since the non-linear dynamic response of beam is not excited by the incident-wave frequencies. This experimental case is further divided into two subcases corresponding to different submerged beam lengths. Subcases 1 and 2 respectively have *0.25m* and *0.5m* of the beam submerged. 

</details>

<details>

<summary>Case-2 experiments: interactions of regular water waves with the flexible beam when the carriage is moving at a constant speed</summary>

- Experimental Case 2 concerns interactions with the flexible beam when the carriage is moving at a constant speed. Moving the carriage changes the frequency of encounter between beam and waves, so that the dynamic response of the beam and its interaction with water waves, particularly at the onset of
resonance, can be studied. By changing the steepness of the regular waves, both linear and nonlinear FSI solvers can be validated. This experimental case is further divided into two subcases corresponding to different submerged beam lengths. Subcases 1 and 2 respectively have *0.25m* and *0.5m* of the beam submerged.

</details>

<details>

<summary>Case-3 experiments: interactions of irregular water waves with the flexible beam when the carriage is at rest</summary>

- Experimental Case 3 concerns steep, irregular-wave interactions with the flexible beam when the carriage is at rest. This is the most complex case and is designed to yield data on structural dynamics due to nonlinear wave-loading processes related to steep and breaking waves. This case will help to validate the high-fidelity FSI solvers. 

</details>


## FSI Experiments: Interactions of water-waves with a flexible beam

All measurements are given in the form of *.h5* format files, each of which has a corresponding *.pan* format file containing details of measurement names, units, frequency, maximum, minimum and standard deviation. The data presented is classified into different folders whose description is as follows: 

- Folder **Exp1_carriage_rest_0.25m** 
- Folder **Exp1_carriage_rest_0.5m** 
- Folder **Exp2_carriage_moving_0.25m** 
- Folder **Exp2_carriage_moving_0.5m** 
- Folder **Exp3_irreg_waves_0.25m** 
- Folder **Exp3_irreg_waves_0.5m** 
- Folder **hammer_test**

The description of the measurement and corresponding wave parameters is given in each folder.
