unit Unit10;

interface

uses
  System.Math,
  Generics.Collections,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type

  TRifa = class
  public
    Nome: string;
    Endereco: string;
    Telefone: string;
  public
    constructor Create(const ANome, AEndereco, ATelefone: string);
  end;


  TForm10 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    EdtNumero: TEdit;
    EdtNome: TEdit;
    EdtEndereco: TEdit;
    EdtTelefone: TEdit;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    Sorteio: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure AdicionaHash( const Chave: Integer );

  public
    { Public declarations }
    VendasRifa: TObjectDictionary<Integer, TRifa>;

    TabelaHash: array of Integer;
  end;

var
  Form10: TForm10;



implementation

{$R *.dfm}

{ TRifa }

constructor TRifa.Create(const ANome, AEndereco, ATelefone: string);
begin
  Nome:= ANome;
  Endereco:= AEndereco;
  Telefone:= ATelefone;
end;

procedure TForm10.AdicionaHash(const Chave: Integer);
var
  Indice: Integer;
begin
  Indice:= Length( TabelaHash );

  SetLength( TabelaHash, Succ( Indice ));

  TabelaHash[ Indice ]:= Chave;
end;

procedure TForm10.BitBtn1Click(Sender: TObject);
begin

  VendasRifa.Add( StrToInt(EdtNumero.Text ),
    TRifa.Create( EdtNome.Text, EdtEndereco.Text, EdtTelefone.Text ) );

  AdicionaHash( StrToInt(EdtNumero.Text ) );
end;

procedure TForm10.BitBtn2Click(Sender: TObject);
var
  Sorteio: Integer;
begin
  Randomize();

  Sorteio:= Random( Length( TabelaHash ) );

  ShowMessage( VendasRifa.Items[TabelaHash[Sorteio]].Nome );

end;

procedure TForm10.FormCreate(Sender: TObject);
begin
  VendasRifa:= TObjectDictionary<Integer, TRifa>.Create();
end;

procedure TForm10.FormDestroy(Sender: TObject);
begin
  FreeAndNil( VendasRifa );
end;

end.
