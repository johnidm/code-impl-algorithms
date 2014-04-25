unit Edit.BorderColor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Vcl.StdCtrls;

type
  TEdit = class(Vcl.StdCtrls.TEdit)
  private
    procedure MessagePaint(var Msg: TMessage); message WM_NCPAINT;
    procedure SetBorder(AColor: TColor);
    procedure PaintEdit(DC: HDC; ARect: TRect; EColor, BColor: TColor);
  public
    { Public declarations }
  end;



implementation

procedure TEdit.SetBorder(AColor: TColor);
var
  Canvas: TCanvas;
begin
  Canvas := TCanvas.Create;
  try
    Canvas.Handle := GetWindowDC(Handle);
    Canvas.Pen.Style := psSolid;
    Canvas.Pen.Color := AColor;
    Canvas.Brush.Style := bsClear;
    Canvas.Rectangle(0, 0, Width, Height);
  finally
    ReleaseDC(Handle, Canvas.Handle);
    Canvas.Free;
  end;
end;

procedure TEdit.MessagePaint(var Msg: TMessage);
var
  DC: HDC;
  Rect: TRect;
begin
  DC := GetWindowDC(Handle);
  try
    Windows.GetClientRect(Handle, Rect);
    PaintEdit(DC, Rect, clWindow, clBlue);
  finally
    ReleaseDC(Handle, DC);
  end;
end;

procedure TEdit.PaintEdit(DC: HDC; ARect: TRect; EColor, BColor: TColor);
var
  WindowColor: TColor;
  BorderColor: TColor;
begin
  WindowColor := EColor; // Color of TEdit
  BorderColor := BColor; // Border Color of TEdit
  if not Enabled then
  begin
    WindowColor := clBtnFace;
    BorderColor := clRed;
  end;
  InflateRect(ARect, 4, 4);
  Brush.Color := WindowColor;
  Windows.FillRect(DC, ARect, Brush.Handle);
  SetBorder(BorderColor);
end;

end.
