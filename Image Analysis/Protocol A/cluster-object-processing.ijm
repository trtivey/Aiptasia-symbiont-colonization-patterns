//modify input and output folder paths
input = "/Users/ttivey/Desktop/input/";
output = "/Users/ttivey/Desktop/output/";

//Set batch mode to process all images in the input folder
setBatchMode(true);
list = getFileList(input);
for (i = 0; i <list.length; i++)
	action(input, output, list[i]);
setBatchMode(false);

	
function action(input, output, filename) {
open(input + filename);		
run("8-bit");
//gaussian blur
run("Gaussian Blur...", "sigma=1");
//subtract background
run("Subtract Background...", "rolling=50");
//threshold
setAutoThreshold("MaxEntropy");
//convert to mask
setOption("BlackBackground", false);
run("Convert to Mask");
//invert
run("Invert");
saveAs("Jpeg", output + filename);
//objects counter
run("3D Objects Counter", "slice=1 min.=10 statistics summary centres_of_masses objects");
//Results
selectWindow("Results");
saveAs("Text", output + filename);
run("Close");
//Centres of map JPEG
selectWindow("Centres of mass map of " + filename);
t=getTitle;
saveAs("Jpeg", output + t);
selectWindow("Centres of mass map of " + filename);
close();
//Objects map JPEG
selectWindow("Objects map of " + filename);
t=getTitle;
saveAs("Jpeg", output + t);
selectWindow("Objects map of " + filename);
close();


//history provides summary object data count for each input file in folder
selectWindow("Log");
saveAs("Text", output + "/symtest-log.txt");

}
