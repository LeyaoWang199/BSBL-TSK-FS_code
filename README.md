# BSBL-TSK-FS_code
We develop a fuzzy inference system based on block sparse Bayesian learning (BSBL), named BSBL-TSK-FS. The system classifies m6A sites in several tissues of human, mouse, and rat. Under the five-fold cross-validation (5-CV) method, the accuracy of the BSBL-TSK-FS model is 0.84-0.95. The best results for each dataset are saved in the folder.

Running "tsk_demo.m". Modify the parameters in “tsk.m”. The optimal parameters for 11 datasets are shown in the table below.

Datasets k lambda h

mb 2 0.5 5

mh 2 0.5 5

mk 2 0.5 5

ml 2 0.5 5

mt 1 0.5 5

hb 2 0.5 5

hk 1 0.5 5

hl 1 0.5 5

rb 1 0.5 5

rk 2 0.5 5

rl 2 0.5 5
