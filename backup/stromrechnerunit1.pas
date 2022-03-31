unit stromrechnerunit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  StdCtrls, ExtCtrls, Types, aboutus, aboutstromrechner;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnBerechnen: TButton;
    Editevul1GeskMitBonus: TEdit;
    Editevul1GeskOhneBonus: TEdit;
    Editevul1GeskMitTreueBonus: TEdit;
    Editevul2GeskMitBonus: TEdit;
    Editevul2GeskOhneBonus: TEdit;
    Editevul2GeskMitTreueBonus: TEdit;
    Editevu2name: TEdit;
    Editevul2verbrauchspreis: TEdit;
    Editevul2grundkostenprojahr: TEdit;
    Editevul2grundkostenpromonat: TEdit;
    Editevul2neukundebonus: TEdit;
    Editevul2sofortbonus: TEdit;
    Editevul2treuebonus: TEdit;
    Editevul1neukundebonus: TEdit;
    Editevul1sofortbonus: TEdit;
    Editevul1treuebonus: TEdit;
    Editevu1name: TEdit;
    Editevul1verbrauchspreis: TEdit;
    Editevul1grundkostenprojahr: TEdit;
    Editevul1grundkostenpromonat: TEdit;
    editName: TEdit;
    EditVerbrauch: TEdit;
    EditPLZ: TEdit;
    EditStadt: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    LBLVergleich: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    procedure BtnBerechnenClick(Sender: TObject);
    procedure Editevul1grundkostenpromonatChange(Sender: TObject);
    procedure Editevul2grundkostenpromonatChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TForm1.Editevul1grundkostenpromonatChange(Sender: TObject);
   var
     grundkostenJahr, grundkostenmonat : real;
begin
    grundkostenmonat :=StrToFloat(Editevul1grundkostenpromonat.Text);
    grundkostenJahr := grundkostenmonat * 12;
    Editevul1grundkostenprojahr.Text := FloatToStr(grundkostenJahr);
end;

procedure TForm1.BtnBerechnenClick(Sender: TObject);
   var
     //KundenVariablen
     intKVerbrauch              : integer;

     //EVUL1
     intEvul1Verbrauchspreis    : integer;
     realEvul1GrundkostenJahr   : real;
     realErgebnisEvul1OhneBonus : real;
     realErgebnisEvul1MitBonus  : real;
     realEvul1Neukundenbonus    : real;
     realEvul1GesMitbonus       : real;
     realEvul1Sofortbonus       : real;
     realEvul1Treuebonus        : real;

     //EVUL2
     intEvul2Verbrauchspreis    : integer;
     realEvul2GrundkostenJahr   : real;
     realErgebnisEvul2OhneBonus : real;
     realErgebnisEvul2MitBonus  : real;
     realEvul2Neukundenbonus    : real;
     realEvul2GesMitbonus       : real;
     realEvul2Sofortbonus       : real;
     realEvul2Treuebonus        : real;

begin

    //Variablen zuweisung Informationen von Kunden
    intKVerbrauch            := StrToInt(EditVerbrauch.Text);

    //Variablen zuweisung informationen des EVUL1
    intEvul1Verbrauchspreis  := StrToInt(Editevul1verbrauchspreis.Text);
    realEvul1GrundkostenJahr := StrToFloat(Editevul1grundkostenprojahr.Text);
    realEvul1Neukundenbonus  := StrToFloat(Editevul1neukundebonus.Text);
    realEvul1Sofortbonus     := StrToFloat(Editevul1sofortbonus.Text);
    realEvul1Treuebonus      := StrToFloat(Editevul1treuebonus.Text);

    //Variablen zuweisung informationen des EVUL2
    intEvul2Verbrauchspreis  := StrToInt(Editevul2verbrauchspreis.Text);
    realEvul2GrundkostenJahr := StrToFloat(Editevul2grundkostenprojahr.Text);
    realEvul2Neukundenbonus  := StrToFloat(Editevul2neukundebonus.Text);
    realEvul2Sofortbonus     := StrToFloat(Editevul2sofortbonus.Text);
    realEvul2Treuebonus      := StrToFloat(Editevul2treuebonus.Text);

    //Berechnung der Kosten des EVUL1
    realErgebnisEvul1OhneBonus   := intKVerbrauch * intEvul1Verbrauchspreis / 100;
    realErgebnisEvul1OhneBonus   := realErgebnisEvul1OhneBonus + realEvul1GrundkostenJahr;
    realErgebnisEvul1MitBonus    := realErgebnisEvul1OhneBonus - realEvul1Neukundenbonus - realEvul1Sofortbonus;
    realEvul1GesMitbonus         := realErgebnisEvul1OhneBonus - realEvul1Treuebonus;


    //Berechnung der Kosten des EVUL2
    realErgebnisEvul2OhneBonus   := intKVerbrauch * intEvul2Verbrauchspreis / 100;
    realErgebnisEvul2OhneBonus   := realErgebnisEvul2OhneBonus + realEvul2GrundkostenJahr;
    realErgebnisEvul2MitBonus    := realErgebnisEvul2OhneBonus - realEvul2Neukundenbonus - realEvul2Sofortbonus;
    realEvul2GesMitbonus         := realErgebnisEvul2OhneBonus - realEvul2Treuebonus;

    //Ausgabe der Kosten des EVUL1
    Editevul1GeskOhneBonus.Text  := FloatToStrF(realErgebnisEvul1OhneBonus, ffCurrency, 5, 2);
    Editevul1GeskMitBonus.Text   := FloatToStrF(realErgebnisEvul1MitBonus, ffCurrency, 5, 2);
    Editevul1GeskMitTreueBonus.Text :=FloatToStrF(realEvul1GesMitbonus, ffCurrency, 5, 2);

    //Ausgabe der Kosten des EVUL2
    Editevul2GeskOhneBonus.Text  := FloatToStrF(realErgebnisEvul2OhneBonus, ffCurrency, 5, 2);
    Editevul2GeskMitBonus.Text   := FloatToStrF(realErgebnisEvul2MitBonus, ffCurrency, 5, 2);
    Editevul2GeskMitTreueBonus.Text :=FloatToStrF(realEvul2GesMitbonus, ffCurrency, 5, 2);

    //Ausgabe Vergelich und Empfehlung
    IF (realErgebnisEvul1MitBonus < realErgebnisEvul2MitBonus) Then
       Begin
          LBLVergleich.caption := 'Stromanbieter 1 ist günstiger und für Sie zu empfehlen. ';
       end
    Else
        Begin
          LBLVergleich.caption := 'Stromanbieter 2 ist günstiger und für Sie zu empfehlen. ';
        end;
end;

procedure TForm1.Editevul2grundkostenpromonatChange(Sender: TObject);
    var
      grundkostenJahr2, grundkostenmonat2 : real;
begin
    grundkostenmonat2 := StrToFloat(Editevul2grundkostenpromonat.Text);
    grundkostenJahr2 := grundkostenmonat2 * 12;
    Editevul2grundkostenprojahr.Text := FloatToStr(grundkostenJahr2);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
    LBLVergleich.caption := '';
end;

procedure TForm1.Label25Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  form3.Show;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
     form2.Show;
end;

end.

