
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
path_to_directory = "~/"                                #
#                                                       #
# file1 should be the name (including the file          #
# extension) of the first file to compare. Exclude all  # 
# forward slashes                                       #
#                                                       #
file1 = "file1.txt"                                     #
#                                                       #
# file2 should be the name (including the extension) of #
# the second file (to be compared against file1).       #
#                                                       #
file2 = "file2.md"                                      #
#                                                       #
# now provide a name for the output file, including the #
# .txt extension                                        #
output.f = "results.txt"                                #
#                                                       #
#########################################################


#  Script start, you (probably) shouldn't modify below  #


# combine paths shorthand
f1 = paste0(path_to_directory, file1)
f2 = paste0(path_to_directory, file2)


# read each file into a buffer
b1 = readChar(f1, file.info(f1)$size)
b2 = readChar(f2, file.info(f2)$size)


# do the splits
splits = c(" |(\r\n|\r|\n)")
t1 = unlist(strsplit(b1, splits))
t2 = unlist(strsplit(b2, splits))


# tidy env (for debugging)
# rm(f1, f2, b1, b2, file1, file2, splits)


groups_t1 = length(t1) %/% 2
groups_t2 = length(t2) %/% 2


if (length(t1) %% 2 == 0) {
  
  t1a = tapply(t1, 
               rep(1:groups_t1, each = 2), 
               paste, 
               collapse = " ")
  t1b = tapply(t1[2:(length(t1)-1)], 
               rep(1:(groups_t1 - 1), each = 2), 
               paste, 
               collapse = " ") 
  t1 = unique(c(t1a, t1b))
  
} else {
  
  t1a = tapply(t1[-1], 
               rep(1:groups_t1, each = 2), 
               paste, 
               collapse = " ")
  t1b = tapply(t1[1:(length(t1)-1)], 
               rep(1:groups_t1, each = 2), 
               paste, 
               collapse = " ") 
  t1 = unique(c(t1a, t1b))
  
}

if (length(t2) %% 2 == 0) {
  
  t2a = tapply(t2, 
               rep(1:groups_t2, each = 2), 
               paste, 
               collapse = " " )
  t2b = tapply(t2[2:(length(t2)-1)], 
               rep(1:(groups_t2 - 1), each = 2), 
               paste, 
               collapse = " ") 
  t2 = unique(c(t2a, t2b))
  
} else {
  
  t2a = tapply(t2[-1], 
               rep(1:groups_t2, each = 2), 
               paste, 
               collapse = " ")
  t2b = tapply(t2[1:(length(t2)-1)], 
               rep(1:groups_t2, each = 2), 
               paste, 
               collapse = " ") 
  t2 = unique(c(t2a, t2b))
  
}


# compare token lists
similarities = t1[t1 %in% t2]
similarities = similarities[similarities != ""]


# write comparison results to new file
write(unique(similarities), paste0(path_to_directory, output.f))


# clean-up environment
rm(f1, f2, b1, b2, splits, 
   file1, file2, path_to_directory, 
   t1, t2, t1a, t1b, t2a, t2b, 
   groups_t1, 
   groups_t2, 
   similarities, output.f)

