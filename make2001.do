** construct dta files form raw data
** =================================

** Loop over all 2001 SIPP panel do files as supplied by NBER
** note that the do files of each wave have have been adapted
** to work with this script.

** if you downloaded my git repository, you have got a folder 2001/
** that contains all modified NBER do files.

** if for some reason you don't want to use those,
** you must MANUALLY change the NBER scripts so that they take 
** an input argument. In particular, you must ERASE everything above the
** commented line:

** The line below does NOT need to be changed

** with this:

/*clear*/
/*cap log close*/
/*local dat_name "../dat/`2'.dat"*/

/*** The following line should contain the path to your output '.dta' file */

/*local dta_name "../dta/`1'.dta"*/

/*** The following line should contain the path to the data dictionary file */

/*local dct_name "`1'.dct"*/

** https://github.com/floswald/SippData

** copyright NBER. see the original file in do_NBER



clear
set more off
cd ~/datasets/SIPP/2001/do


forvalues i = 1(1)9  {

	** if core data does not exist, make it
	capture confirm file "../dta/sippl01puw`i'.dta"
	if _rc!=0 {
		
		display "doing core wave `i'"
		do sip01w`i'.do sip01w`i' l01puw`i'

	} 


	** if topical module data does not exist, make it
	capture confirm file "../dta/sippp01putm`i'.dta"
	if _rc!=0 {
		
		display "doing topical wave `i'"
		do sip01t`i'.do sip01t`i' p01putm`i'
	}
}


