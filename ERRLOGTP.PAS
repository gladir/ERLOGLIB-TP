{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/ERLOGLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit ERRLOGTP;

INTERFACE

Function GetFileNameAccess:String;
Function GetFileNameError:String;
Procedure SendAccessMessage(Const Msg:String);
Procedure SendErrorMessage(Const Msg:String);
Procedure SetFileNameAccess(FileName:String);
Procedure SetFileNameError(FileName:String);

IMPLEMENTATION

Uses DOS;

Var
 FileNameAccess,FileNameError:String;

Function PadRight(S:String;Space:Byte):String;
Var
 I:Byte;
Begin
 If Length(S)<Space Then For I:=Length(S)+1 to Space do S:=S+' ';
 PadRight:=S;
End;

Function PadZeroLeft(Value:Integer;Space:Byte):String;
Var
 S:String;
Begin
 Str(Value,S);
 While Length(S)<Space do S:='0'+S;
 PadZeroLeft:=S;
End;

Function GetFileNameAccess:String;Begin
 GetFileNameAccess:=FileNameAccess;
End;

Function GetFileNameError:String;Begin
 GetFileNameError:=FileNameError;
End;

Procedure SendAccessMessage(Const Msg:String);
Var
 FileAccess:Text;
 Year,Month,Day,DOW,Hour,Min,Sec,CentSec:Word;
Begin
 {$I-}Assign(FileAccess,FileNameAccess);
 Append(FileAccess);{$I+}
 If IoResult<>0 Then Begin
  {$I-}Rewrite(FileAccess);{$I+}
 End;
 If IOResult=0 Then Begin
  GetDate(Year,Month,Day,DOW);
  GetTime(Hour,Min,Sec,CentSec);
  Write(FileAccess,Year:4,'-',PadZeroLeft(Month,2),'-',
        PadZeroLeft(Day,2),' ',Hour:2,':',PadZeroLeft(Min,2),':',
        PadZeroLeft(Sec,2),'.',CentSec,' ');
  WriteLn(FileAccess,Msg);
  Close(FileAccess);
 End
  Else
 Begin
  WriteLn('Impossible d''Çcrire le LOG d''accäs');
  Halt;
 End;
End;

Procedure SendErrorMessage(Const Msg:String);
Var
 FileError:Text;
 Year,Month,Day,DOW,Hour,Min,Sec,CentSec:Word;
Begin
 {$I-}Assign(FileError,FileNameError);
 Append(FileError);{$I+}
 If IoResult<>0 Then Begin
  {$I-}Rewrite(FileError);{$I+}
 End;
 If IOResult=0 Then Begin
  GetDate(Year,Month,Day,DOW);
  GetTime(Hour,Min,Sec,CentSec);
  Write(FileError,Year:4,'-',PadZeroLeft(Month,2),'-',
        PadZeroLeft(Day,2),' ',Hour:2,':',PadZeroLeft(Min,2),':',
        PadZeroLeft(Sec,2),'.',CentSec,' ');
  WriteLn(FileError,Msg);
  Close(FileError);
 End
  Else
 Begin
  WriteLn('Impossible d''Çcrire le LOG d''erreur : ',FileNameError);
  Halt;
 End;
End;

Procedure SetFileNameAccess(FileName:String);Begin
 FileNameAccess:=FileName;
End;

Procedure SetFileNameError(FileName:String);Begin
 FileNameError:=FileName;
End;

BEGIN
 {$IFDEF LINUX}
  FileNameAccess:='/var/log/access.log';
  FileNameError:='/var/log/error.log';
 {$ELSE}
  FileNameAccess:='access.log';
  FileNameError:='error.log';
 {$ENDIF}
END.