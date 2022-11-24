program MicroHospital_p;

uses
  Forms,
  MicroHospital_u in 'MicroHospital_u.pas' {MicroHospital},
  MicroHospitalDataModule in 'MicroHospitalDataModule.pas' {DataModule1: TDataModule};

{$R *.res}

   begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMicroHospital, MicroHospital);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
