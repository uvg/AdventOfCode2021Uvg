Class AOC2021.Day01 Extends AOC2021.Base
{

Parameter InputFile = "d01.txt";

// d ##class(AOC2021.Day01).Run()

ClassMethod Part1(verbose = 0) As %String [ Private ]
{
	do ..GetInputToArray(..#InputFile,.recordsArr)
    set count=0,line=""
	for  {
		set line=$order(recordsArr(line)) quit:line=""
		set depth=recordsArr(line)
		if line>1,depth>prev set count=count+1
		set prev=depth
		if verbose write !,line,"=",count
	}
	quit count
}

ClassMethod Part2(verbose = 0) As %String [ Private ]
{
	do ..GetInputToArray(..#InputFile,.recordsArr)
    set count=0
	set line=2
	for  {
		set line=$order(recordsArr(line)) quit:line=""
		set depths($increment(depths))=recordsArr(line)+recordsArr(line-1)+recordsArr(line-2)
	}
	set line=""
	for  {
		set line=$order(depths(line)) quit:line=""
		set depth=depths(line)
		if line>1,depth>prev set count=count+1
		set prev=depth
		if verbose write !,line,"=",count
	}
	quit count
}

}

