# Aiptasia-symbiont-colonization-patterns

Code accompanying Aiptasia symbiont colonization manuscript "Spatial and Temporal Patterns of Symbiont Colonization and Loss During Bleaching in the Model Sea Anemone Aiptasia", published in Frontiers in Marine Science.  https://doi.org/10.3389/fmars.2022.808696

#### "Image Analysis" contains protocols and scripts for video image capture, image-stack export, image-stack merging, and FIJI/ImageJ2 image processing that results in the collection of abundance and size of symbiont clusters. Output files created from these protocols can be used for data analysis or further processed in R to convert pixel area into symbiont counts per cluster.

Folder "Protocol A" contains the ImageJ macro used for converting only epifluorescence images into object cluster counts which can then be further processed into symbiont count data in R.

Folder "Protocol B" contains macros used to select image focal areas using brightfield images and then counts algal symbionts in the corresponding epifluorescence image. This pipeline instead converts pixel area to symbiont number prior to generating object datasets and provides summary excel files for symbiont cluster size and cluster location.

#### "R-data-analysis" contains analyses performed in R for Figures 2 through 5, as well as supplemental graphs and statistics.

Folder "Figure-2" includes an Rmarkdown file and a corresponding csv data file.

Folder "Figure-3" includes an Rmarkdown file as well as the subfolder directories "all-3d-obj-counts" and "summary csv" necessary to recreate statistical analyses for Table 2 and figure plots for Figure 3.

Folder "Figure-4" includes two Rmarkdown files, "Figure-4-Data-Analysis.Rmd" and "Figure-4-Statistics.Rmd" which can be used to recreate figure plots for Figure 4 and Table 3 statistics respectively.

Folder "Figure-5 includes an Rmarkdown file a folder subdirectory to recreate Figure 5. 
