unit MicroHospital_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls,
  jpeg, ExtCtrls, Buttons, OleCtrls, SHDocVw, pngimage, Grids, DBGrids, MicroHospitalDataModule, Math,
  Spin, Data.DB;

type
  TMicroHospital = class(TForm)
    tbshome: TTabSheet;
    tbsmap: TTabSheet;
    tbsinfo: TTabSheet;
    tbspatientinfo: TTabSheet;
    tbsnews: TTabSheet;
    tbsAdmin: TTabSheet;
    maintabcontrol: TPageControl;
    headerbackground: TImage;
    lbltitle: TLabel;
    lbltitle1: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    btngomap: TButton;
    btngoinfo: TButton;
    btngonews: TButton;
    btngoookup: TButton;
    btngoadmin: TButton;
    Image2: TImage;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Shape1: TShape;
    Button17: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Admintabcontrol: TPageControl;
    tbsdatabase: TTabSheet;
    tbslogfile: TTabSheet;
    btnlogout: TButton;
    btnlogin: TButton;
    Psw: TEdit;
    Usr: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    WebBrowsernews: TWebBrowser;
    btnwebcovid: TButton;
    imgfacemask: TImage;
    richadmin: TRichEdit;
    pnladmin: TPanel;
    btnadminloadfile: TButton;
    Button8: TButton;
    Label9: TLabel;
    Label10: TLabel;
    btnwebhiv: TButton;
    btnwebcdc: TButton;
    btnwebsahealth: TButton;
    Button11: TButton;
    DMMicrohospital: TDBGrid;
    pnladmin1: TPanel;
    btnadminloadclientinfo: TButton;
    btnadminloadrooms: TButton;
    Label12: TLabel;
    btnadmineditoff: TButton;
    btnadminediton: TButton;
    Label13: TLabel;
    Label8: TLabel;
    edtpatientlookupname: TEdit;
    edtpatientlookuproom: TEdit;
    edtpatientlookupbed: TEdit;
    edtpatientlookupnumber: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Button6: TButton;
    richpatientlookup: TRichEdit;
    Label14: TLabel;
    btnadduser: TButton;
    edtpsw1: TEdit;
    edtpsw2: TEdit;
    edtusr: TEdit;
    imgqr: TImage;
    Label11: TLabel;
    pnlworkinghours: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    pnlsupport: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    btnloadwebsite: TButton;
    webmhwebsite: TWebBrowser;
    lblsort: TLabel;
    btnsort: TButton;
    pnladdclient: TPanel;
    edtaddname: TEdit;
    edtaddcondition: TEdit;
    edtaddid: TEdit;
    edtaddphone: TEdit;
    edtaddemail: TEdit;
    btnaddclient: TButton;
    pnldeleteclient: TPanel;
    btndeleteclient: TButton;
    spndeleteclient: TSpinEdit;
    Label34: TLabel;
    Label35: TLabel;
    cobaddroom: TComboBox;
    edtnames: TEdit;
    Label36: TLabel;
    Button1: TButton;
    btngohome: TButton;
    btngoclose: TBitBtn;
    Image3: TImage;
    procedure btngonewsClick(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure btngomapClick(Sender: TObject);
    procedure btngoinfoClick(Sender: TObject);
    procedure btngoookupClick(Sender: TObject);
    procedure btngoadminClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnloginClick(Sender: TObject);
    procedure btnlogoutClick(Sender: TObject);
    procedure btnwebcovidClick(Sender: TObject);
    procedure btnadminloadfileClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure btnwebhivClick(Sender: TObject);
    procedure btnwebcdcClick(Sender: TObject);
    procedure btnwebsahealthClick(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure btnadminloadclientinfoClick(Sender: TObject);
    procedure btnadminloadroomsClick(Sender: TObject);
    procedure btnadmineditoffClick(Sender: TObject);
    procedure btnadmineditonClick(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure btnadduserClick(Sender: TObject);
    procedure btnloadwebsiteClick(Sender: TObject);
    procedure btnsortClick(Sender: TObject);
    procedure imgqrClick(Sender: TObject);
    procedure btnaddclientClick(Sender: TObject);
    procedure btndeleteclientClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnadminsearchClick(Sender: TObject);
    procedure btngohomeClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
  var
  loginrecord : textfile;
  iwrong : integer;
  btab : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MicroHospital: TMicroHospital;
 


implementation

{$R *.dfm}

 procedure SetGridColumnWidths(Grid: Tdbgrid);
const
  DEFBORDER = 10;
var
  temp, n: Integer;
  lmax: array [0..30] of Integer;
begin
  with Grid do
  begin
    Canvas.Font := Font;
    for n := 0 to Columns.Count - 1 do
      lmax[n] := Canvas.TextWidth(Fields[n].FieldName) + DEFBORDER;
    grid.DataSource.DataSet.First;
    while not grid.DataSource.DataSet.EOF do
    begin
      for n := 0 to Columns.Count - 1 do
      begin
        temp := Canvas.TextWidth(trim(Columns[n].Field.DisplayText)) + DEFBORDER;
        if temp > lmax[n] then lmax[n] := temp;
      end; {for}
      grid.DataSource.DataSet.Next;
    end;
    grid.DataSource.DataSet.First;
    for n := 0 to Columns.Count - 1 do
      if lmax[n] > 0 then
        Columns[n].Width := lmax[n];
  end;
end; {SetGridColumnWidths}

procedure TMicroHospital.btnlogoutClick(Sender: TObject);
begin
//logging out part one
admintabcontrol.enabled := false;
admintabcontrol.Visible := false;
btnlogout.Enabled := false;
psw.Enabled := true;
usr.Enabled := true;

//saving lougout to loginrecord
assignfile(loginrecord, 'loginrecord.txt');
reset(loginrecord);
append(loginrecord);
writeln(loginrecord,'Logout: ' + usr.Text + ' on ' + datetostr(date) + ' at ' + timetostr(time));
closefile(loginrecord);

//logging out part two
psw.Clear;
usr.Clear;
btnlogin.Enabled := true;

//verifying and setfocus
psw.Enabled := true;
usr.Enabled := true;
btnlogin.SetFocus;
end;

procedure TMicroHospital.btnsortClick(Sender: TObject);
var
arrline : array[1..10000] of string;
sline, stemp : string;
I, k, il, ik : integer;
begin
assignfile(loginrecord,'loginrecord.txt');

//getting ready
richadmin.Clear;
reset(loginrecord);
il := 0;
ik := 0;

//getting the total number of eneteries
repeat
begin
 readln(loginrecord,sline);

 il := il + 1;
 arrline[il] := sline;
end
until eof(loginrecord) ;

//sorting
 for k := 1 to il - 1 do
  for i := k + 1 to il do
    begin
      if arrline[k] > arrline[i] then
      begin
        stemp := arrline[k];
        arrline[k] := arrline[i];
        arrline[i] := stemp;
      end;
    end;

//Displaying
 while not( ik = il) do
 begin
 ik := ik + 1;
richadmin.Lines.Add(arrline[ik]);
 end;


closefile(loginrecord);
end;

procedure TMicroHospital.Button11Click(Sender: TObject);
begin
//load website
webbrowsernews.Navigate('https://www.cdc.gov/tobacco/index.htm');
end;

procedure TMicroHospital.Button12Click(Sender: TObject);
begin
//presenting information
showmessage('Intensive Care Unit. Please speak to reception to visit the room.');
end;

procedure TMicroHospital.Button13Click(Sender: TObject);
begin
//presenting information
showmessage('Cancer. You may visit this room.');
end;

procedure TMicroHospital.Button14Click(Sender: TObject);
begin
//presenting information
showmessage('Quarantine. Unfortunaltly you wont be able to visit this area. Please speak to reception for more inforamtion.');
end;

procedure TMicroHospital.Button15Click(Sender: TObject);
begin
//presenting information
 showmessage('Tuberculosis. Please speak to reception to visit the room.');
end;

procedure TMicroHospital.Button16Click(Sender: TObject);
begin
//presenting information
showmessage('General Room 1. You may visit this room.');
end;

procedure TMicroHospital.Button17Click(Sender: TObject);
begin
//presenting information
showmessage('General Room 2. You may visit this room.');
end;

procedure TMicroHospital.Button18Click(Sender: TObject);
begin
maintabcontrol.activepage := tbshome;
end;

procedure TMicroHospital.Button1Click(Sender: TObject);
var
sline : string;
tnames : textfile;
begin
assignfile(Tnames,'Nameforcredentials.txt');

//reading and displaying
richadmin.Clear;
reset(Tnames);
while not eof(Tnames) do
begin
readln(Tnames,sline);
richadmin.Lines.Add(sline);
end;
closefile(Tnames);
end;

procedure TMicroHospital.Button2Click(Sender: TObject);
begin
 with DataModule1 do
 begin
  QRYmicrohosptal.SQL
 end;
end;

procedure TMicroHospital.btnadminsearchClick(Sender: TObject);
var
il,ik, k, i : integer;
sline :string;
arrline : array[1..10000] of string;
stemp : string;
tnames1 : textfile;
begin
//getting ready
//reading names from names file
assignfile(tnames1,'Nameforcredentials.txt');
il:=0;
i := 0;
reset(tnames1);
while not eof(tnames1) do
begin
readln(tnames1, sline);
sline:= copy(sline,pos(':',sline) + 1,pos(';', sline));
delete(sline,pos(';',sline),pos(';',sline));
arrline[i] := sline;
inc(il);
inc(i);
end;
closefile(tnames1);

//sorting
 for k := 1 to il - 1 do
  for i := k + 1 to il do
    begin
      if arrline[k] > arrline[i] then
      begin
        stemp := arrline[k];
        arrline[k] := arrline[i];
        arrline[i] := stemp;
      end;
    end;

end;

procedure TMicroHospital.Button6Click(Sender: TObject);
begin
with DataModule1 do
begin
  if tblclient.Locate('Name',uppercase(edtpatientlookupname.Text),[]) = true then
  begin
   edtpatientlookuproom.Text := tblclient['Room'];
   edtpatientlookupnumber.Text := tblclient['Patient Number'];
  end
  else
  begin
    Showmessage('Not found. You can try check the spelling entered or speak to reception.');
    exit;
  end;
  if tblroom.Locate('Bed1',edtpatientlookupnumber.Text,[])= true then
  begin
    edtpatientlookupbed.Text := '1';
  end else
    begin
      if tblroom.Locate('Bed2',edtpatientlookupnumber.Text,[])= true then
      begin
        edtpatientlookupbed.Text := '2';
      end else
      begin
        if tblroom.Locate('Bed3',edtpatientlookupnumber.Text,[])= true then
      begin
        edtpatientlookupbed.Text := '3';
      end else
      begin
        if tblroom.Locate('Bed4',edtpatientlookupnumber.Text,[])= true then
      begin
        edtpatientlookupbed.Text := '4';
      end else
      begin
         if tblroom.Locate('Bed5',edtpatientlookupnumber.Text,[])= true then
      begin
        edtpatientlookupbed.Text := '5';
      end else
      begin
        edtpatientlookupbed.Text := 'N/A';
      end;
      end;
      end;
      end;

    end;

end;
end;

procedure TMicroHospital.btndeleteclientClick(Sender: TObject);
begin
with Datamodule1 do
begin
//checking if usercode entered exists
if tblclient.Locate('Patient Number',spndeleteclient.Value,[]) = true then
begin
//deleting from tblclient
 tblclient.Delete;
//searching and deleteing the record in tblroom
 if tblroom.Locate('Bed1',spndeleteclient.Value,[])= true then
 begin
  tblroom.edit;
   tblroom['Bed1'] := '0';
   tblroom.post;
 end else
 begin
   if tblroom.Locate('Bed2',spndeleteclient.Value,[])= true then
 begin
 tblroom.edit;
   tblroom['Bed2'] := '0';
   tblroom.post;
 end else
 begin
   if tblroom.Locate('Bed3',spndeleteclient.Value,[])= true then
 begin
 tblroom.edit;
   tblroom['Bed3'] := '0';
   tblroom.post;
 end else
 begin
    if tblroom.Locate('Bed4',spndeleteclient.Value,[])= true then
 begin
 tblroom.edit;
   tblroom['Bed4'] := '0';
   tblroom.post;
 end else
 begin
if tblroom.Locate('Bed5',spndeleteclient.Value,[])= true then
 begin
 tblroom.edit;
   tblroom['Bed5'] := '0';
   tblroom.post;
 end else
 begin
 //warrning if not found in tblroom
   showmessage('Rooms Data Failed. Not Found!');
 end;
 end;
 end;
 end;
 end;
//showing everything is complete
 showmessage('Deleted.');
end else
begin
//showing that everything failed
showmessage('Failed, record not found!');
exit;
end;

end;
end;
procedure TMicroHospital.btnaddclientClick(Sender: TObject);
var
  float        : Extended;
  errorPos, Inum ,i,a,z,x, itemp    : Integer;
  arrnames : array[1..10000] of string;
  arrnumber : array[1..10000]  of integer;
  arrrest : array[1..10000] of string;
  tarchive : textfile;
  sline, stemp : string;
  k: Integer;
begin
begin
//checking information
if (edtaddname.Text = 'Name and Surname') or (length(edtaddname.Text) = 0) then
begin
showmessage('You have to enter a name or surname.');
exit;
end;

if (edtaddcondition.Text = 'Condition') or (length(edtaddcondition.Text)=0) then
begin
showmessage('You have to enter a condition.');
exit;
end;

if (edtaddid.Text = 'ID Number') or not(length(edtaddid.Text)=13) then
begin
showmessage('You have to enter a correct ID number.');
exit;
end;

if (edtaddphone.Text = 'Phone number.') or not(length(edtaddphone.Text) = 10) then
begin
showmessage('You have to enter a correct phone number.');
exit;
end;

if (edtaddemail.Text = 'Email Address') or (length(edtaddemail.Text) = 0) then
begin
showmessage('You have to enter a email address.');
exit;
end;


//validating ID and phone number
val(edtaddphone.Text,float,errorpos);
 if not(errorpos = 0) then
 begin
   showmessage('Please enter a correct phone number.');
   exit;
 end;
end;
Val(edtaddid.Text,float,errorpos);
if not(errorpos = 0) then
begin
  showmessage('Please enter a correct ID number.');
   exit;
end;

//Adding to database
DataModule1.tblclient.Insert;
DataModule1.tblclient['Name']  := uppercase(edtaddname.Text);
DataModule1.tblclient['Condition']  := uppercase(edtaddcondition.Text);
DataModule1.tblclient['ID']  := edtaddid.Text;
DataModule1.tblclient['Phone number']  := edtaddphone.Text;
DataModule1.tblclient['Email']  := uppercase(edtaddemail.Text);
DataModule1.tblclient['Room']  := cobaddroom.Text;
DataModule1.tblclient.Post;

//showing message
datamodule1.tblclient.locate('Name',uppercase(edtaddname.text),[]);
 inum := datamodule1.tblclient['Patient Number'];
Showmessage('Added, please load rooms and allocate a bed for patient ('+inttostr(inum)+').');

//checking for archive file
if not fileexists('Archive.txt') then
begin
  assignfile(tarchive,'Archive.txt');
  rewrite(tarchive);
  closefile(tarchive);
end;
//backing up to archive file
assignfile(tarchive, 'Archive.txt');
append(tarchive);
writeln(tarchive,uppercase(edtaddname.Text +',' +inttostr(inum)+',' +edtaddcondition.Text +',' +  cobaddroom.Text +','+ edtaddphone.Text +',' + edtaddemail.Text+',' + edtaddid.Text+';' ) );
reset(tarchive);
i:=0;
while not eof(tArchive) do
begin
  inc(i);
  readln(tarchive,sline);
  arrnames[i] := copy(sline,1,pos(',', sline) -1);
  delete(sline,1,pos(',',sline));
  arrnumber[i] := strtoint(copy(sline,1,pos(',', sline)-1));
  delete(sline,1,pos(',',sline));
  arrrest[i] := sline;
end;
closefile(tarchive);

for a := 1 to i - 1 do
  for z := a + 1 to i do
    if arrnames[a] > arrnames[z] then
      begin
        stemp := arrnames[a];
        arrnames[a] := arrnames[z];
        arrnames[z] := stemp;

        itemp := arrnumber[a];
        arrnumber[a] := arrnumber[z];
        arrnumber[z] := itemp;

        stemp := arrrest[a];
        arrrest[a] := arrrest[z];
        arrrest[z] := stemp;
      end;


assignfile(tarchive,'Archive.txt');
rewrite(tarchive);
reset(tarchive);
append(tarchive);
for k := 1 to i  do
begin
writeln(tarchive,arrnames[k] + ',' + inttostr(arrnumber[k]) + ','+arrrest[k]);
end;
closefile(tarchive);

 //reseting
edtaddname.Text := 'Name and Surname';
edtaddcondition.Text := 'Condition';
edtaddid.Text := 'ID Number';
edtaddemail.Text := 'Email';
cobaddroom.Text := 'Room Number';
edtaddphone.Text := 'Phone Number';






end;

procedure TMicroHospital.btnloadwebsiteClick(Sender: TObject);
begin
//loading website webmhwebsite.Width := 446;
webmhwebsite.Height := 202;
webmhwebsite.Navigate('www.microhospital.com');
end;

procedure TMicroHospital.btngomapClick(Sender: TObject);
begin
maintabcontrol.ActivePage := tbsmap;
btnwebcovid.Click;
end;

procedure TMicroHospital.btnloginClick(Sender: TObject);
var
arrcredentials : array[0..100] of string;
arrnames : array[0..100] of string;
i, k, a : integer;
logincredentials : textfile;
brun, bnames: boolean;
line, stemp : string;
begin
//checking input and other issues
if length(usr.Text) = 0 then
begin
  showmessage('You must enter a user code!');
  exit;
end;

if length(psw.Text) = 0 then
begin
  showmessage('You must enter a password!');
  exit;
end;

if usr.Text = '0' then
begin
  showmessage('0 may not be used as a user code!');
  exit;
end;

//checking if record file exists
if not fileexists('loginrecord.txt') then
begin
 //if not creating a new file
  assignfile(loginrecord,'loginrecord.txt');
  rewrite(loginrecord);
  closefile(loginrecord);
  showmessage('Record file doesnt exist, new file created.');
end;

//brutforce attack protection
if iwrong = 3 then
begin
  showmessage('Incorrect credentials entered 3 times! Good bye.') ;
  assignfile(loginrecord, 'loginrecord.txt');
  reset(loginrecord);
  append(loginrecord);
  writeln(loginrecord,'Application Termination: ' + 'Brutforce attack protection' + ' on ' + datetostr(date) + ' at ' + timetostr(time));
  closefile(loginrecord);
  application.Terminate;
  exit;
end;

//Checking if credential file exists
if not fileexists('logincredentials.txt')  then
begin
  showmessage('Credentials not found! Critial error. Good bye.');
  assignfile(loginrecord, 'loginrecord.txt');
  reset(loginrecord);
  append(loginrecord);
  writeln(loginrecord,'Application Termination: ' + 'Credentials not found' + ' on ' + datetostr(date) + ' at ' + timetostr(time));
  closefile(loginrecord);
  application.Terminate;
end;

//Names = true unless found otherwise
bnames := true;
//Checking if Names file exists
if not fileexists('Nameforcredentials.txt')  then
begin
  showmessage('Names not found! Please contact support.');
  assignfile(loginrecord, 'loginrecord.txt');
  reset(loginrecord);
  append(loginrecord);
  writeln(loginrecord,'Missing Files: ' + 'Names file' + ' on ' + datetostr(date) + ' at ' + timetostr(time));
  closefile(loginrecord);
  bnames := false;
end;


//reading usercodes and passwords from credential file
assignfile(logincredentials,'logincredentials.txt');
i:=0;
reset(logincredentials);
while not eof(logincredentials) do
begin
//checking for to many users
  if i > 99 then
  begin
    showmessage('Too many usercodes! Please contact support. ');
    break;
  end;
readln(logincredentials, line);
line:= copy(line,pos(':',line) + 1,pos(';', line));
delete(line,pos(';',line),pos(';',line));
arrcredentials[i] := line;
inc(i);
end;
closefile(logincredentials);

//reading names from names file
assignfile(logincredentials,'Nameforcredentials.txt');
i:=0;
reset(logincredentials);
while not eof(logincredentials) do
begin
//checking for to many users
  if i > 99 then
  begin
    showmessage('Too many names! Please contact support. ');
    bnames := false;
    break;
  end;
readln(logincredentials, line);
line:= copy(line,pos(':',line) + 1,pos(';', line));
delete(line,pos(';',line),pos(';',line));
arrnames[i] := line;
inc(i);
end;
closefile(logincredentials);


//verifiying usercode to password and logging in
if psw.Text = arrcredentials[strtoint(usr.Text)] then
begin
{login part one}
if bnames = true then
 showmessage('Wellcome, ' + arrnames[strtoint(usr.text)] + '. You are being logged in.');
 admintabcontrol.enabled := true;
 admintabcontrol.Visible := true;
 btnlogin.Enabled := false;
 btnlogout.Enabled := true;
{saving login to loginrecord}
 assignfile(loginrecord, 'loginrecord.txt');
 reset(loginrecord);
 append(loginrecord);
 writeln(loginrecord,'Login: ' + usr.Text + ' on ' + datetostr(date) + ' at ' + timetostr(time));
 closefile(loginrecord);
{login part two}
 usr.Enabled := false;
 psw.Enabled := false;
 iwrong := 0;
 i := 0;
 btnadduser.Enabled := true;
 edtpsw1.Enabled := true;
 edtpsw2.Enabled := true;
 assignfile(logincredentials,'logincredentials.txt');
 reset(logincredentials);
 brun := false;
 while brun = false and not(eof(logincredentials)) do
 begin
  readln(logincredentials,line) ;
  inc(i);
  line := copy(line,1, pos(':',line)-1) ;
  if line = '' then
  begin
    brun := true;
   break;
   end;
  if not( strtoint(line) + 1 = i) then
  begin
    brun := true;
   break;
  end;
end;

 closefile(logincredentials);

 //loading database
 btnadminloadclientinfo.Click;

//checking for max users
 if i > 99 then
 begin
  btnadduser.Enabled := false;
  edtpsw1.Enabled := false;
  edtpsw2.Enabled := false;
  showmessage('Too many users! Please contact support.');
 end else
 begin
  edtusr.Text := inttostr(i -1 );
 end;
end else
begin
//brutforce protection
inc(iwrong);
showmessage('User code or password is incorrect! ' + inttostr((4 - iwrong)) + ' trys remianing.');
assignfile(loginrecord, 'loginrecord.txt');
reset(loginrecord);
append(loginrecord);
writeln(loginrecord,'Wrong Password: ' + 'user code= ' +usr.Text + ' password= ' + psw.Text + ' on ' + datetostr(date) + ' at ' + timetostr(time));
closefile(loginrecord);
end;
btnadminloadfile.Click;
end;


procedure TMicroHospital.btngoinfoClick(Sender: TObject);
begin
maintabcontrol.ActivePage := tbsinfo;
end;

procedure TMicroHospital.btngonewsClick(Sender: TObject);
begin
maintabcontrol.ActivePage := tbsnews;
btnwebcovid.Click;
end;

procedure TMicroHospital.btngoookupClick(Sender: TObject);
begin
maintabcontrol.ActivePage := tbspatientinfo;
end;

procedure TMicroHospital.btngoadminClick(Sender: TObject);
begin
maintabcontrol.ActivePage := tbsadmin;
usr.SetFocus;
end;



procedure TMicroHospital.btngohomeClick(Sender: TObject);
begin
maintabcontrol.ActivePage := tbshome;
end;

procedure TMicroHospital.btnadduserClick(Sender: TObject);
var
adduserfile : textfile;
begin
//check if passwords where entered
 if  (length(edtpsw1.Text) = 0) or (length(edtpsw2.Text) = 0) then
 begin
 showmessage('A password must be entered. No user was saved!') ;
  exit;
 end;

//check if passwords match
 if not (edtpsw1.Text = edtpsw2.Text) then
 begin
 showmessage('Your new passwords dont match. No user was saved!') ;
  exit;
 end;

//saving new user
 assignfile(adduserfile,'logincredentials.txt') ;
 reset(adduserfile);
 append(adduserfile);
 writeln(adduserfile, edtusr.Text + ':' + edtpsw1.Text + ';');
 closefile(adduserfile);
 showmessage('New user: ' + edtusr.Text + ' was saved.');

//reseting
edtusr.Text := inttostr(1 + strtoint(edtusr.Text));
edtpsw1.Text := 'Enter New Password';
edtpsw2.Text := 'Repeat Password';
end;

procedure TMicroHospital.btnadmineditoffClick(Sender: TObject);
begin
DMMicrohospital.ReadOnly := true;
btnadmineditoff.Enabled := false;
btnadminediton.Enabled := true;
end;

procedure TMicroHospital.btnadmineditonClick(Sender: TObject);
begin
//enabling editing
DMMicrohospital.ReadOnly := false;
btnadmineditoff.Enabled := true;
btnadminediton.Enabled := false;
showmessage('Editing was enabled! Any edting will be saved automatically and cant be undone.');

//checking if SQL was used
if btab = true then
begin
  Datamodule1.tblclient.Active := false;
 DMMicrohospital.DataSource := DataModule1.DSRtblclient ;
     Datamodule1.tblclient.Active := false;
 SetGridColumnWidths(DMMicrohospital);
end;


end;

procedure TMicroHospital.btnadminloadclientinfoClick(Sender: TObject);
begin
DMMicrohospital.datasource :=  DataModule1.drsqrymicrohostal ;
btab := true;

with DataModule1 do
begin
  QRYmicrohosptal.active := false;
  QRYmicrohosptal.Sort;
  QRYmicrohosptal.sql.text := 'select * from ClientInfo';
  QRYmicrohosptal.active := true;
end;

btnadmineditoff.Click;
DMMicrohospital.ReadOnly := true;
SetGridColumnWidths(DMMicrohospital);
pnladdclient.Enabled := true;
btnaddclient.enabled := true;
btndeleteclient.Enabled := true;
pnldeleteclient.Enabled := true;

end;

procedure TMicroHospital.btnadminloadfileClick(Sender: TObject);
var
sline: string;
begin

assignfile(loginrecord,'loginrecord.txt');

//reading and displaying
richadmin.Clear;
reset(loginrecord);
while not eof(loginrecord) do
begin
readln(loginrecord,sline);

richadmin.Lines.Add(sline);

end;
closefile(loginrecord);

end;

procedure TMicroHospital.btnadminloadroomsClick(Sender: TObject);
begin
btab := false;
DMMicrohospital.DataSource := DataModule1.dsrtblroom;
btnadmineditoff.Click;
DMMicrohospital.ReadOnly := true;
SetGridColumnWidths(DMMicrohospital);
pnladdclient.Enabled := false;
btnaddclient.enabled := false;
btndeleteclient.Enabled := false;
pnldeleteclient.Enabled := false;
end;

procedure TMicroHospital.Button8Click(Sender: TObject);
begin
 //verrifying
if inputbox('Verify','Please type "ERASE"','') = 'ERASE' then
begin
  assignfile(loginrecord,'loginrecord.txt');
  reset(loginrecord);

 //erasing
  rewrite(loginrecord);
  closefile(loginrecord);

  //writing to the record
 assignfile(loginrecord, 'loginrecord.txt');
 reset(loginrecord);
 append(loginrecord);
 writeln(loginrecord,'Erased: ' + usr.Text + ' on ' + datetostr(date) + ' at ' + timetostr(time));
 closefile(loginrecord);
 showmessage('Erased.');
 richadmin.Clear;
 sleep(1000);
application.ProcessMessages;
 btnadminloadfile.click;


end else
begin
// verification
showmessage('Failed');

exit;


end;

end;

procedure TMicroHospital.btnwebcdcClick(Sender: TObject);
begin
//load website
webbrowsernews.Navigate('https://www.cdc.gov/');
end;

procedure TMicroHospital.btnwebcovidClick(Sender: TObject);
begin
//load website
webbrowsernews.Navigate('https://www.cdc.gov/coronavirus/2019-ncov/index.html');
end;

procedure TMicroHospital.btnwebhivClick(Sender: TObject);
begin
//load website
webbrowsernews.Navigate('https://www.cdc.gov/hiv/basics/whatishiv.html');
end;

procedure TMicroHospital.btnwebsahealthClick(Sender: TObject);
begin
//load website
webbrowsernews.Navigate('http://www.health.gov.za/');
end;

procedure TMicroHospital.FormActivate(Sender: TObject);
begin
//setting program
admintabcontrol.enabled := false;
admintabcontrol.Visible := false;
btnlogout.Enabled := false;
webmhwebsite.Width := 446;
webmhwebsite.Height := 202;

end;

procedure TMicroHospital.imgqrClick(Sender: TObject);
begin
//presenting information
showmessage('www.MicroHospital.com');
end;

end.
