import "GeneratorTemplate.nimf"
import osproc,strutils,sequtils

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
  var p = dir & "/" & directory
  echo p





