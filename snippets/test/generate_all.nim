import osproc,strutils,sequtils,os

### Templates
include "GeneratorTemplate.nimf"
include "DefArgParser.nimf"

### Getting direcotiries 
proc dir_criteria(inp:string): bool =
  if inp.len() != 0:
    return true
  else:
    return false

proc readableResult(command:string,pred: proc(x:string):bool):seq[string]=
   result = execProcess(command).split("\n").filter(dir_criteria)
  

let dir = readableResult("pwd",dir_criteria)[0]
let languages =readableResult("find -maxdepth 1 -mindepth 1 -type d -printf '%P\n'",dir_criteria);

for directory in languages:
  var foldername = dir & "/" & directory & "/" 
  var file: File
  var def_Arg:File 
  if open(file,foldername & "snip.nim",fmWrite):
    var content:string = gen_Code_Gen(directory)
    write(file,content)
    close(file)
    let specific_arg_fixer_name = foldername & "arg_" & directory & ".nim"
    if fileExists(specific_arg_fixer_name):
      if open(def_Arg,specific_arg_fixer_name,fmWrite):
        var content:string = DefArg()
        write(def_Arg,content)
        close(def_Arg)
