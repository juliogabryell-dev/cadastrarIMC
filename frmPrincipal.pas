unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, dxGDIPlusClasses, RxAnimate,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxLabel, Vcl.Mask;

type
  TformCalculoIMC = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnCalcular: TButton;
    Panel3: TPanel;
    lblAltura: TLabel;
    lblPeso: TLabel;
    AnimatedImage1: TAnimatedImage;
    edtAltura: TMaskEdit;
    edtPeso: TMaskEdit;
    procedure btnCalcularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCalculoIMC: TformCalculoIMC;

implementation

{$R *.dfm}

procedure TformCalculoIMC.btnCalcularClick(Sender: TObject);
var
altura, resultado: Double;
peso: Double;

begin

    if (Trim(edtPeso.Text) = '') or (Trim(edtAltura.Text) = '')  then
     begin
       showMessage('Não foi preenchido os campos de altura ou peso');
       Exit;
     end;

    if not TryStrToFloat(edtPeso.Text, peso) or not TryStrToFloat(edtAltura.Text, altura) then
     begin
      ShowMessage('Por favor, insira apenas números válidos para peso e altura.');
      Exit;
      end;

    if (peso > 0) and (altura > 0) then
     begin
      resultado := peso / (altura * altura);

      if resultado < 18.5 then
          ShowMessage('IMC: ' + FormatFloat('0.00', resultado) + ' - Abaixo do peso.')
      else if (resultado >= 18.5) and (resultado < 25) then
          ShowMessage('IMC: ' + FormatFloat('0.00', resultado) + ' - Peso saudável.')
      else if (resultado >= 25) and (resultado < 30) then
          ShowMessage('IMC: ' + FormatFloat('0.00', resultado) + ' - Sobrepeso.')
      else if (resultado >= 30) and (resultado < 40) then
          ShowMessage('IMC: ' + FormatFloat('0.00', resultado) + ' - Obesidade.')
      else
          ShowMessage('IMC: ' + FormatFloat('0.00', resultado) + ' - Obesidade Grave.');
     end
     else
     begin
      ShowMessage('O peso e a altura devem ser valores maiores que zero.');
     end;


end;


procedure TformCalculoIMC.FormShow(Sender: TObject);
begin
edtAltura.SetFocus;
end;

end.
