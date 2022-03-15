//This macro allows you to find a tentacle area in a brightfield image then use that same ROI to select the symbiodinium in a flourecent image to be analyzed
//For the symbiodinium this macro finds their grouping and location.
//The outputs include Symbiodinium cell counts, cell position, cells per cluster, tentacle area

waitForUser("Clear ROI, then click OK");

dir=getDirectory("Choose a Directory of images to count Symbiodinium cells");
list=getFileList(dir);

dirb=getDirectory("Choose a Directory of images to analyse host");
listb=getFileList(dirb);

dirR=getDirectory("Choose a Directory for results");

//setBatchMode(true);
for (f=0; f<list.length; f++){
	path=dir+list[f];
	pathb=dirb+listb[f];
if (!endsWith(path,"/")){open(path);
	t=getTitle;
	open(pathb);
	b=getTitle;
	}
if (nImages >=1) {
//if (endsWith(path,"f")) {
selectWindow(t);
run("8-bit");
selectWindow(b);
run("8-bit");
setTool("polygon");
waitForUser("outlin e base of tentacle and arround rest of tentacle, then click OK");
setBackgroundColor(0, 0, 0);
run("Clear Outside");
run("Threshold...");
waitForUser("Set threshold manually, click Apply, close dialogue, then click OK");
run("Convert to Mask");
run("Fill Holes");
waitForUser("Make sure all areas of the tentacle are black, then click OK");
run("Analyze Particles...", "size=1000-Infinity add");
selectWindow(b);
saveAs(dirR + b + "_Host_results_image.tif");
selectWindow(t);
roiManager("Select", 0);
waitForUser("Rotate ROI so it includes all symbiodinium, then click OK");
roiManager("Add");
roiManager("Select", 0);
roiManager("Delete");
run("Set Measurements...", "area feret's redirect=None decimal=3");
roiManager("Select", 0);
run("Measure");
selectWindow("Results");
saveAs("Results", dirR + t + "_Host_results.csv");
run("Clear Results");
roiManager("Select", 0);
run("Clear Outside");
run("Threshold...");
roiManager("Deselect");
roiManager("Delete");
z=getNumber("are there symbiodinium? 0=n 1=y", 1);
if (z>0) {;
	waitForUser("Set threshold manually, click Apply, close dialogue, then click OK");
	run("Particle Remover", "size=0-9");
	run("Clear Results");
	selectWindow(t + 2);
	run("ITCN ");
	waitForUser("Block out any problem areas, accept ITCN dimension, let it finish running (Results box appears), then click OK");
	saveAs(dirR + t + "_count_results_image.tif");
	selectWindow("Results");
	saveAs("Results", dirR + t + "_ITCN_results.txt");
	selectWindow("Results " + t + "2");
	run("Duplicate...", " ");
	setOption("BlackBackground", false);
	run("Make Binary");
	run("Analyze Particles...", "add");
	close();
	selectWindow("Results " + t + "2");
	changeValues(0xffffff,0xffffff,0x7a7a7a);
	
	run("Clear Results");
	for(i=0; i<roiManager("count"); i++) {
		roiManager("select", i);
		run("Color Pixel Counter", "color=Red cells=1 pixels=1 minimum=255 display");
		run("Add Selection...");
	};
	roiManager("Deselect");
	roiManager("Delete");
	selectWindow("Results");
	saveAs("Results", dirR + t + "_count_results.csv");
	selectWindow("Results " + t + "2");
	run("8-bit");
	run("Threshold...");
	waitForUser("Set threshold manually, click Apply, close dialogue, then click OK");
	run("Analyze Particles...", "add");
	run("Set Measurements...", "center redirect=None decimal=3");
	for(i=0; i<roiManager("count"); i++) {
		roiManager("select", i);
		run("Measure");
		run("Add Selection...");
	};
	selectWindow("Results");
	saveAs("Results", dirR + t + "_Position_results.csv");
	roiManager("Deselect");
	roiManager("Delete");
	close();
	close();
}
close();
close();
selectWindow("Results");
run("Close");

list2 = getList("window.titles"); 
for (i=0; i<list2.length; i++){ 
winame = list2[i]; 
selectWindow(winame); 
run("Close"); 


list2b = getList("window.titles"); 
for (i=0; i<list2b.length; i++){ 
winameb = list2b[i]; 
selectWindow(winameb); 
run("Close"); 
}
}

}
}
//}
