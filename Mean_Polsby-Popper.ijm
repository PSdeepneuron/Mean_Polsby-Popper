//Set directory to save results in table to use for analysis
#@ File (style="directory") imageFolder;
dir = File.getDefaultDir;
dir = replace(dir,"\\","/"); 

waitForUser("Ground truth", "Open the table containing the ground truth data,\nthen press OK.");
area_microns_1 = Table.getColumn("compactness_Poslby-Popper");

Array.getStatistics(area_microns_1, min, max, mean, stdDev);

mean_array = newArray();
mean_array = Array.concat(mean_array,mean);

save_option = getBoolean("Want to save results?");
if (save_option == 1){
//Make a table containing the arrays
Table.create("Mean_Polsby-Popper");
Table.setColumn("Mean_Polsby-Popper",mean_array);
Table.save(dir+"Mean_Polsby-Popper"+".csv");
}

