@if (@X)==(@Y) @end /* Harmless hybrid line that begins a JScript comment
@goto :Batch
 
::************ Documentation ***********
::JSORT.BAT version 4.2
:::
:::JSORT [File] [/Option [Value]]...
:::
:::  Sort lines of text from stdin and write the result to stdout.
:::  JSORT uses an ascending, case sensitive text sort by default.
:::
:::    File - If the optional File argument is specified, then JSORT reads lines
:::           from the file instead of from stdin. If specified, the File must
:::           be the very first argument.
:::
:::  Options:
:::
:::    /C n - Number of sorted lines to print. Skipped lines are always printed
:::           and do not contribute to the count. Default is -1 (all lines).
:::
:::    /D String - Specifies the string used to delimit tokens. The delimiter
:::           string is always case sensitive. A quote literal " must be escaped
:::           as \q, and a backslash literal \ must be escaped as \\.
:::           The default value is an empty string, meaning treat the entire
:::           line as a single token.
:::
:::    /I   - Ignore case when sorting (or when checking for uniqueness)
:::
:::    /N   - Sort consecutive digits as numbers instead of text. The numbers
:::           may be embedded within alpha text. JSort supports numbers up to
:::           20 digits long.
:::
:::    /O File - Writes the output to File instead of stdout.
:::
:::    /P n - Begin sorting at character position n relative to the beginning
:::           of the selected token. Lines that do not extend that far are
:::           treated as equivalent values, and collate before all other lines.
:::           The default value is 1 (first character).
:::
:::    /R   - Sort the lines in Reverse (descending) order.
:::
:::    /S n - Number of lines to skip - default is 0.
:::           Skipped lines are not sorted (remain in place)
:::
:::    /T n - Specify the token at which to begin sorting. The sort is not
:::           restricted to the selected token, it just helps to identify where
:::           to begin sorting. The default value is 1 (first token). A value of
:::           -1 represents the last token, -2 the penultimate token, etc.
:::           A value of 0 is invalid. Note that negative values only recognize
:::           tokens that occur after a delimiter. If the requested token cannot
:::           be found, then the line will collate before all other lines.
:::
:::    /U   - Only write unique lines (discard duplicates)
:::
:::    /V   - Display the version of JSORT.BAT.
:::
:::    /?   - Display this help
:::
:::JSORT.BAT was written by Dave Benham and originally posted at
:::http://www.dostips.com/forum/viewtopic.php?f=3&t=5595
:::

============== :Batch portion =============
@echo off
setlocal disableDelayedExpansion

:: Get optional input file
set "infile="
set "test=%~1"
if defined test (
  setlocal enableDelayedExpansion
  if "!test:~0,1!" neq "/" (
    endlocal
    set ^"infile=^<"%~1""
    shift /1
  ) else endlocal
)

:: Define options
set "options= /?: /c:-1 /d:"" /i: /n: /o:"" /p:1 /r: /s:0 /t:1 /u: /v: "

:: Set default option values
for %%O in (%options%) do for /f "tokens=1,* delims=:" %%A in ("%%O") do set "%%A=%%~B"

:: Get options
:loop
if not "%~1"=="" (
  setlocal enableDelayedExpansion
  set "test=!options:* %~1:=! "
  if "!test!"=="!options! " (
      >&2 echo Error: Invalid option %~1
      exit /b 1
  ) else if "!test:~0,1!"==" " (
      endlocal
      set "%~1=1"
  ) else (
      endlocal
      set "%~1=%~2"
      shift /1
  )
  shift /1
  goto :loop
)

:: Display help
if defined /? (
  for /f "delims=: tokens=*" %%A in ('findstr "^:::" "%~f0"') do echo(%%A
  exit /b 0
)

:: Display version
if defined /v (
  for /f "delims=: tokens=*" %%A in ('findstr /bc:"::JSORT.BAT version" "%~f0"') do echo %%A
  exit /b 0
)

:: Transform and validate options
set /a "case=0%/i%, num=0%/n%, pos=%/p%-1, tok=%/t%, unique=0%/u%, order=1-2*0%/r%, 1/!(0x80000000&pos), 1/tok" 2>nul || (
  >&2 echo Error: Invalid option value.
  exit /b 1
)
if %tok% gtr 0 set /a tok-=1
set "outfile="
if defined /o set ^"outfile=^>"%/o%""

:: Perform the sort
%infile% %outfile% cscript //E:JScript //nologo "%~f0" %case% %num% %pos% %order% %/s% %/c% %tok% "%/d%" %unique%

exit /b 0

************* JScript portion **********/
var array=new Array(),
    nocase =WScript.Arguments.Item(0),
    numeric=WScript.Arguments.Item(1),
    pos    =parseInt(WScript.Arguments.Item(2)),
    order  =WScript.Arguments.Item(3),
    skip   =WScript.Arguments.Item(4),
    count  =WScript.Arguments.Item(5),
    token  =WScript.Arguments.Item(6),
    delim  =WScript.Arguments.Item(7).replace(/\\(?!q|\\)/g,'').replace(/\\\\/g,'\\s').replace(/\\q/g,'"').replace(/\\s/g,'\\'),
    unique =WScript.Arguments.Item(8);
while (!WScript.StdIn.AtEndOfStream) {
  if (skip > 0) {
    WScript.Echo(WScript.StdIn.ReadLine());
    skip-=1
  } else {
    var expanded="", num="", raw=WScript.StdIn.ReadLine(), upper=((nocase==1)?raw.toUpperCase():raw);
    for( var i=pos+FindToken(raw,delim,token); i<raw.length; i++ ) {
      var c=upper.substr(i,1);
      if (numeric==1 && c>="0" && c<="9") {
        num+=c;
      } else {
        if (num != "") {
          num="00000000000000000000" + num;
          expanded+=num.substr(num.length-20);
          num="";
        }
        expanded+=c;
      }
    }
    if (num != "") {
      num="00000000000000000000" + num;
      expanded+=num.substr(num.length-20);
    }
    var obj={expanded:expanded, raw:raw};
    array.push(obj);
  }
}
if (count<0) count=array.length;
if (count>array.length) count=array.length;
if (unique==1) {
  array.sort( function(a,b){
                var rtn = (a.expanded>b.expanded)-(a.expanded<b.expanded);
                if (rtn==0) {
                  var a2=(nocase==1)?a.raw.toUpperCase():a.raw;
                  var b2=(nocase==1)?b.raw.toUpperCase():b.raw;
                  rtn = (a2>b2)-(a2<b2);
                }
                return order*rtn;
              });
  if (count>=1) WScript.Echo(array[0].raw);
  for (var i=1; i<count; i++) {
    if (nocase==1 && array[i].raw.toUpperCase() == array[i-1].raw.toUpperCase()) continue;
    if (nocase==0 && array[i].raw == array[i-1].raw) continue;
    WScript.Echo(array[i].raw);
  }
} else {
  array.sort(function(a,b){return order*((a.expanded>b.expanded)-(a.expanded<b.expanded));});
  for (var i=0; i<count; i++) WScript.Echo(array[i].raw);
}

function FindToken(str, str2, n) {
  if (n!=0 && str2=="") return str.length;
  if (n>=0) {
    var rtn = 0;
    for( var i=n; i>0; i-- ) {
      rtn = str.indexOf(str2,rtn);
      if (rtn<0) return str.length;
      rtn+=str2.length;
    }
  } else {
    var rtn = str.length;
    for (var i=n; i<0; i++ ) {
      rtn-=1;
      rtn = str.lastIndexOf(str2,rtn);
      if (rtn<0) return str.length;
    }
    rtn+=str2.length;
  }
  return rtn;
}