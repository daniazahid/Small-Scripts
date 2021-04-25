# Small-Scripts

<p>Q1.sh contains a generic shell scripting code to print full, left or right pattern. This script takes in two parametric values, pattern option {left,right,full} and pattern number (could be any positive integer).</p>

<p>Q2.sh is a script that displays a main menu and perform tasks based on the input value.
Valid input values = {1, 2, 3, 4, exit}.<br>
The different options 1,2,3,4 will display the output as follow:<br>
1. Input a filename from user and display permissions of that particular file. Then
invert the permissions e.g. If permissions were r-x change them to -w-. Then again
display the updated permissions of that file. <br>
2. Input a filename and a string and search it in the file. Output the lines of file where
that string is found. But if the string contains a dot(.) it means any character can
fill the place. For example: 

string = c.t = {cat, cot, c t,}
<br>
3. Create a file dummy.txt and add the content of all the files in the current directory to
dummy. But copy the content in such a way that if files in current directory = {f1, f2,
f3, f4, ..., fn}. Then copy first N lines of files at even location {f2, f4,.} and last N lines
of files at odd location {f1,f3,. }. Input value of N from user.<br>

4. Input a filename from user and check modified date of that file. If modified date is
greater than 24 hours from the current time change the modified date to current date.
Along with displaying the output on terminal, maintain a log file that contains the
information of the script. </p>

<p>Q3.sh is a shell script to automatically create a file hierarchy using input from user and then change file hierarchy using 'forward' or 'backward' pass to indicate which file hierarchy you want. The program exits upon entering the letter 'e'</p>

