var loadLayersFromScript = true;  
//@includepath "/c/program files/adobe/Adobe Photoshop 2020/Presets/Scripts/"   
//@include "load files into stack.jsx"  
var topFolder = new Folder("C:/Users/ttive/Desktop/Data-photos-batch-as-jpegs-dark-only");
var fileandfolderAr = scanSubFolders(topFolder,/\.(jpg|tif|psd|bmp|gif|png|)$/i);
app.load(File("C:/Users/ttive/Desktop/Mergescript/Auto_Blend.atn"));
jpgSaveOptions = new JPEGSaveOptions()
jpgSaveOptions.embedColorProfile = true
jpgSaveOptions.formatOptions = FormatOptions.STANDARDBASELINE
jpgSaveOptions.matte = MatteType.NONE
jpgSaveOptions.quality = 12


function scanSubFolders(tFolder, mask) { // folder object, RegExp or string
	var sFolders = new Array(); 
    var allFiles = new Array(); 
    sFolders[0] = tFolder; 
    for (var j = 0; j < sFolders.length; j++){ // loop through folders             
        var procFiles = sFolders[j].getFiles();
	var name = sFolders[j].name;
	jpgFile = new File("C:/Users/ttive/Desktop/Data-photos-batch-as-jpegs-dark-only-merge/" + name + "merge.jpeg") 
        for (var i=0;i<procFiles.length;i++){ // loop through this folder contents 
            if (procFiles[i] instanceof File ){
                if(mask==undefined) allFiles.push(procFiles[i]);// if no search mask collect all files
                if (procFiles[i].fullName.search(mask) != -1) allFiles.push(procFiles[i]); // otherwise only those that match mask
        }else if (procFiles[i] instanceof Folder){
            sFolders.push(procFiles[i]);// store the subfolder
            scanSubFolders(procFiles[i], mask);// search the subfolder
         }
      } 
	loadLayers.intoStack(allFiles,true); 
    app.doAction('Test', 'Test')
	jpgSaveOptions = new JPEGSaveOptions()
	jpgSaveOptions.embedColorProfile = true
	jpgSaveOptions.formatOptions = FormatOptions.STANDARDBASELINE
	jpgSaveOptions.matte = MatteType.NONE
	jpgSaveOptions.quality = 12
	app.activeDocument.saveAs(jpgFile, jpgSaveOptions, true,
	Extension.LOWERCASE)
	app.activeDocument.close(SaveOptions.DONOTSAVECHANGES)
	allFiles = []
   } 
   return [allFiles,sFolders]; 
};