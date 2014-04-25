unit Principal;

interface

uses
  FileCtrl,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ImgList;

type
  TForm3 = class(TForm)
    TreeView1: TTreeView;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ListarArquivos(Diretorio: string );
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.ListarArquivos(Diretorio: string);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
  NodeTemp: TTreeNode;
begin

   Ret := FindFirst(Diretorio+'\*.*', faAnyFile, F);
   try
      while Ret = 0 do begin

         if (F.Attr and faDirectory = faDirectory) then
         begin
            if (F.Name <> '.') and (F.Name <> '..') then
            begin
               NodeTemp:= TreeView1.Items.AddChild( TreeView1.Selected, Diretorio );
               NodeTemp.ImageIndex:= 0;
               NodeTemp.SelectedIndex:= 0;

               TreeView1.Selected:= NodeTemp;

               TempNome := Diretorio+'\' + F.Name;
               ListarArquivos(TempNome);

             end;
         end else
         begin
           NodeTemp:= TreeView1.Items.AddChild(  TreeView1.Selected, F.Name );
           NodeTemp.ImageIndex:= 1;
           NodeTemp.SelectedIndex:= 1;

         end;

         Ret := FindNext(F);
      end;
   finally
      FindClose(F);
   end;

   TreeView1.FullExpand();
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
var
  Diretorio: string;
begin
  if SelectDirectory('Selecione um diretório', '', Diretorio) then
    Edit1.Text:= Diretorio;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
 TreeView1.Items.Clear;
  ListarArquivos( Edit1.Text );
end;



end.

