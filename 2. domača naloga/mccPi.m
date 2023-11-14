(* ::Package:: *)

mccPi[n_]:=Module[{to\[CHacek]ke,znKrog},to\[CHacek]ke=RandomReal[{-1,1},{n,2}];
znKrog=Select[to\[CHacek]ke,Norm[#]<=1&];
{znKrog,to\[CHacek]ke}]




(* ::Input:: *)
(*SetDirectory[NotebookDirectory[]];*)
