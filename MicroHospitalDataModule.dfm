object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 377
  Width = 411
  object CONMH: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Client info.mdb;Mod' +
      'e=Share Deny None;Persist Security Info=False;Jet OLEDB:System d' +
      'atabase="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Passwor' +
      'd="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;J' +
      'et OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transac' +
      'tions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create Syst' +
      'em Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don' +
      #39't Copy Locale on Compact=False;Jet OLEDB:Compact Without Replic' +
      'a Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 208
  end
  object tblclient: TADOTable
    Active = True
    Connection = CONMH
    CursorType = ctStatic
    TableName = 'ClientInfo'
    Left = 144
    Top = 80
  end
  object tblroom: TADOTable
    Active = True
    Connection = CONMH
    CursorType = ctStatic
    TableName = 'Rooms'
    Left = 152
    Top = 192
  end
  object QRYmicrohosptal: TADOQuery
    Connection = CONMH
    Parameters = <>
    Left = 160
    Top = 304
  end
  object dsrtblroom: TDataSource
    DataSet = tblroom
    Left = 240
    Top = 200
  end
  object DSRtblclient: TDataSource
    DataSet = tblclient
    Left = 240
    Top = 80
  end
  object drsqrymicrohostal: TDataSource
    DataSet = QRYmicrohosptal
    Left = 248
    Top = 304
  end
end
