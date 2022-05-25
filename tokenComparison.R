
# set the working directory to the location of the files before running

setwd("../../")

# Import 'original' file and 'new' file

originalFileName = "file1.txt"
newFileName      = "file2.txt"

original = readChar(originalFileName, 
                    file.info(originalFileName)$size)
new      = readChar(newFileName, 
                    file.info(newFileName)$size)

rm(originalFileName, newFileName)

original_t = unlist(strsplit(original, " "))
new_t      = unlist(strsplit(new, " "))

similarities = original_t[original_t %in% new_t]

similarities[similarities != ""]

write(similarities, "file3.txt")
