// stk to tiff converter for using in Aivia
stkSource = getDirectory("Select source folder of stk files");
tiffFolder = stkSource + "ConvertedTIFFs";
if (!File.exists(tiffFolder)) {
	File.makeDirectory(tiffFolder);
}
list = getFileList(stkSource);
setBatchMode(true);
for (i = 0; i < list.length; i++){
	if(endsWith(list[i], ".stk")) {
		inputFile = stkSource + list[i];
		run("Bio-Formats (Windowless)", "open=[" +
		inputFile + 
		"]");

		outputFilename = tiffFolder + File.separator + File.nameWithoutExtension + ".tif";
		saveAs("Tiff", outputFilename);
		run("Close All");
	}
}
setBatchMode(false);
exit("Converting completed!");