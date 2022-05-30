
# SPDX-FileCopyrightText: 2022 Orcro Ltd. <team@orcro.co.uk>
# 
# SPDX-LicenseIdentifier: Apache-2.0

#########################################################
#                                                       #
#                 ! Set these variables !               #
#                                                       #
# path_to_directory should be the absolute path on your #
# computer to the *directory* which you will work from. #
# It should contain the files for comparison, and will  #
# be where output is sent to. Include the final         #
# forward-slash.                                        #
#                                                       #
path_to_directory = "~/myfolder/"                       #
#                                                       #
# file1 should be the name (including the file          #
# extension) of the first file to compare. Exclude all  # 
# forward slashes                                       #
#                                                       #
file1 = "myfirstfile.txt"                               #
#                                                       #
# file2 should be the name (including the extension) of #
# the second file (to be compared against file1).       #
#                                                       #
file2 = "mysecondfile.md"                               #
#                                                       #
#########################################################


#  Script start, you (probably) shouldn't modify below  #


# combine paths shorthand
f1 = paste0(path_to_directory, file1)
f2 = paste0(path_to_directory, file2)


# read each file into a buffer
b1 = readChar(f1, file.info(f1)$size)
b2 = readChar(f2, file.info(f2)$size)


# tokenise each buffer by whitespace
t1 = unlist(strsplit(original, " "))
t2 = unlist(strsplit(new, " "))


# tidy env (for debugging)
rm(f1, f2, b1, b2)


# compare token lists
similarities = t1[t1 %in% t2]
similarities[similarities != ""]


# write comparison results to new file
write(unique(similarities), "results.txt")


