{==============================================================================}
{-                   ��������� FloatSpinEdit ��� ����� �����                  -}
{-                       Copyright � 2002 �������� �����                      -}
{==============================================================================}

{------------------------------------------------------------------------------}

{������� ��������

��������� FloatSpinEdit ������������� ��� ����� ����� ����� � �������
�����.

������� ����� ����� ��� ��������������� � ���������� � ���� �����, ��� � 
����������/�������� ��� �������� ��� ������ ���������� ���� TUpDown ��� 
������ Up/Down. ����� ����� �������������� �������� ����������� ��������� 
��������� ����� � ������������ �����. ���������� ��� �� ����������� 
����������� �������� (�������� "�/�"), ����� �����.

��������� ������������ ����� ��������� (TWinControl), ���������� ��� 
���������� FEdit(TFloatEdit - ������� TEdit) � FUpDown(TUpDown).

� ���������� ������� ��������� ����� ��������, ��������� ��� �� ������ 
����������, ��� � �� ������ ����������:

UpDownPosition - ���������� ��������� ���������� FUpDown ������������, 
���������� FEdit (�����/������), �������� �� ��������� ������;

Precision(0..15) - ���������� ������������ ���������� �������� ����, 
��������� ����� �������� �� ��������� ����� 2;

Sufix(string) - ������ ������� �� ����� 20 ��������, ������������ ������� 
(�������� "��") ��������� ����� ��������� ����� ����� ������. �� 
��������� - ������ ������;

Min(Extended) - ���������� ���������� ���������� �������� ��������� 
�����. �� ��������� ����� 100;

Max(Extended) - ���������� ����������� ���������� �������� ��������� 
�����. �� ��������� ����� -100;

Step(Extended) - ���������� ��� ���������  �������� ��������� �����, ��� 
��������� ��� �������� ����������� ������ Up/Down ��� ���������� UpDown. 
�� ��������� ����� 0.25;

NumberValue(Extended) - ���������� �������� ��������� �����, ���� 
�������n ������������ �����, �������� ��������� �������� DefNumberValue;

DefNumberValue(Extended) - ���������� �������� �����, ��� ����� 
������������� ��������. �� ��������� ����� 0;

ArrowKeys(Boolean) - ���������� ����� �� ������������ ������� Up/Down ��� 
���������  �������� ��������� �����. �� ��������� True;

CheckOnExit(Boolean) - ����������, ����� �� ���������������� �������� 
��������� �����, ��� ������ ����������� ������.

����� ���� ��������� "������� �� �����������" ��������� �������� � 
������� ���������� FEdit, �������� ������� ����� ����� � ���������� 
������� Delphi � ������� TEdit:

Text, Font, Color, AutoSize, AutoSelect,
OnEdtChange, OnEdtClick, OnEdtDblClick, OnEdtEnter, OnEdtExit,
OnEdtKeyDown, OnEdtKeyUp, OnEdtKeyPress, SetOnEdtKeyPress,
OnEdtMouseDown, OnEdtMouseUp, OnEdtMouseMove;
����� ����������������� ������� ���������� �� ��� ������� ����������
TEdit ��������� Edt ����� ��������� On.

� ���������� ��� �� ���������� ��� ������-�������:

class function CutSufixStr(InStr: string): string � ������� "��������" 
������� � ���������� ��������� �������� �������� Text, ��������� �������� 
�������� ������ ������ ����������� � ������ ��������-������ Text. ������� 
��������, ��� ������ ������ � ����� ������ �������, ����� �������� 
������������� ��������� ['0'..'9',#8,DecimalSeparator,'-','e','E'], � 
���������� �� �������� (��. ����);

function DefineValue(var Value: Extended): Boolean � ������� �������� � 
���������� Value �������� StrToFloat(FEdit.Text) ���� �������������� 
������ ������� � ��������������� �������� ����� � ��������� [Min ... Max] 
������� ���������� �������� True, � ��������� ������ ������� ���������� 
�������� False, � �������� Value �� ����������. ����� ����� ���� 
����������� ��� �������������� ������������ � �������� ������������� 
��������.

��������� FEdit �������� �������� ������ TFloatEdit = class(TEdit),
������������ � ���� ������. ���� ����� ������ ��������������
������������ ������ �������������� ������� (event-dispatching methods),
��� "���������������" ��������� ��������� �������:

KeyPress-������������ ������� ������� � �� ��������� ������� � ����������
c������, �� ������������� ��������� ['0'..'9',#8,DecimalSeparator,'-
','e','E'];

KeyDown - ��������� ������������ ������� Up/Down ��� ���������  ��������
��������� �����;

Click, DoExit - ��������� �������� ���� ����� ����������, ��� ������
������ ����� � ����������, ���� ����� ���� AutoSelect. DoExit ��� ��
������������ �������� ����������� ��������� ��������� ����� � ���
������������, ���� ����� ���� CheckOnExit;

�������� ����������� ��������� ��������� �������� ��������������,
��������� �������. ���� ������� ������������ �������� (�������� "0..2."),
�� �������� ����� ����� ������ �������� DefNumberValue, ���� ��������
������ Max, �� ��� ��������������� ������ Max, ���� ������� ����� Min, ��
�� ��� ��������������� ������ Min. �������������� �������� ����� �����
��������, �������� �������� NumberValue ��� ����������� � ������
DefineValue.
� ������������ ������� ����� ��� �� ����������������� ����������
������������� ����� � �������� Text, ����� ���� �������� Text �����
��������������� � ������������ �� ���������� Precision � Sufix:

- ��������� �������� ��������� ����� ��������� Up/Down ��� �����������
���������� FUpDown;

- ��� ������ ����������� ������ (������� OnExit), ���� ����� ����
CheckOnExit;}

{------------------------------------------------------------------------------}

unit FloatSpinEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type

  TKeyPrepProc = procedure (var Key: Word; Shift: TShiftState) of object;

  TFloatEdit = class(TEdit)
  private
    FirstClik: Boolean;
    KeyDownPrepProc: TKeyPrepProc;
    DoExitPrepProc: procedure of object;
  protected
    procedure KeyPress(var Key: Char); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Click; override;
    procedure DoExit; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;{TFloatEdit}

  TUpDownPosition=(udpRight, udpLeft);

  TFloatSpinEdit = class(TWinControl)
  private
    //���������� ����������
    FUpDown: TUpDown;
    FEdit: TFloatEdit;
    //���� �������
    FNumberValue: Extended;
    FDefNumberValue: Extended;
    FCheckOnExit: Boolean;
    FSufix: string;
    FStep, FMin, FMax: Extended;
    FPrecision: Byte;
    FUpDownPosition: TUpDownPosition;
    FArrowKeys: Boolean;
    //������ ������/������ �������
    function GetText: string;
    procedure SetText(Value: string);
    function GetFont: TFont;
    procedure SetFont(Value: TFont);
    function GetColor: TColor;
    procedure SetColor(Value: TColor);
    function GetAutoSize: Boolean;
    procedure SetAutosize(Value: Boolean);
    function GetAutoSelect: Boolean;
    procedure SetAutoSelect(Value: Boolean);
    procedure SetUpDownPosition(Value: TUpDownPosition);
    procedure SetDefNumberValue(Value: Extended);
    function GetNumberValue: Extended;
    procedure SetNumberValue(Value: Extended);
    procedure SetSufix(Value: string);
    procedure SetPrecision(Value: Byte);
    //������ ������/������ �������
    function GetOnEdtChange: TNotifyEvent;
    procedure SetOnEdtChange(Value: TNotifyEvent);
    function GetOnEdtClick: TNotifyEvent;
    procedure SetOnEdtClick(Value: TNotifyEvent);
    function GetOnEdtDblClick: TNotifyEvent;
    procedure SetOnEdtDblClick(Value: TNotifyEvent);
    function GetOnEdtEnter: TNotifyEvent;
    procedure SetOnEdtEnter(Value: TNotifyEvent);
    function GetOnEdtExit: TNotifyEvent;
    procedure SetOnEdtExit(Value: TNotifyEvent);
    function GetOnEdtKeyDown: TKeyEvent;
    procedure SetOnEdtKeyDown(Value: TKeyEvent);
    function GetOnEdtKeyUp: TKeyEvent;
    procedure SetOnEdtKeyUp(Value: TKeyEvent);
    function GetOnEdtKeyPress: TKeyPressEvent;
    procedure SetOnEdtKeyPress(Value: TKeyPressEvent);
    function GetOnEdtMouseDown: TMouseEvent;
    procedure SetOnEdtMouseDown(Value: TMouseEvent);
    function GetOnEdtMouseUp: TMouseEvent;
    procedure SetOnEdtMouseUp(Value: TMouseEvent);
    function GetOnEdtMouseMove: TMouseMoveEvent;
    procedure SetOnEdtMouseMove(Value: TMouseMoveEvent);
    //��������� ������������ ��������� �����������
    procedure FUpDownChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: SmallInt;
      Direction: TUpDownDirection);
    procedure FEditKeyDownPrepProc(var Key: Word; Shift: TShiftState);
    procedure FEditDoExitPrepProc;
    //--
    function GetCorrectText: string;
  protected
    procedure SetEnabled(Value: Boolean); override;
  public
    //�������� ��������� �����
    property NumberValue: Extended read GetNumberValue write SetNumberValue;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    //������� "��������" ������
    class function CutSufixStr(InStr: string): string;
    //������� �������� � ���������� Value �������� StrToFloat(FEdit.Text)
    //���� �������������� ������ ������� ������� ��������� �������� True
    function DefineValue(var Value: Extended): Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Enabled;
    property ShowHint;
    //"���������� �� �����������" ������� ���������� FEdit
    property Text: string read GetText write SetText;
    property Font: TFont read GetFont write SetFont;
    property Color: TColor read GetColor write SetColor;
    property AutoSize: Boolean read GetAutoSize write SetAutoSize;
    property AutoSelect: Boolean read GetAutoSelect write SetAutoSelect;
    //"���������� �� �����������" ������� ���������� FEdit
    property OnEdtChange: TNotifyEvent read GetOnEdtChange write SetOnEdtChange;
    property OnEdtClick: TNotifyEvent read GetOnEdtClick write SetOnEdtClick;
    property OnEdtDblClick: TNotifyEvent read GetOnEdtDblClick
      write SetOnEdtDblClick;
    property OnEdtEnter: TNotifyEvent read GetOnEdtEnter write SetOnEdtEnter;
    property OnEdtExit: TNotifyEvent read GetOnEdtExit write SetOnEdtExit;
    property OnEdtKeyDown: TKeyEvent read GetOnEdtKeyDown
      write SetOnEdtKeyDown;
    property OnEdtKeyUp: TKeyEvent read GetOnEdtKeyUp write SetOnEdtKeyUp;
    property OnEdtKeyPress: TKeyPressEvent read GetOnEdtKeyPress
      write SetOnEdtKeyPress;
    property OnEdtMouseDown: TMouseEvent read GetOnEdtMouseDown
      write SetOnEdtMouseDown;
    property OnEdtMouseUp: TMouseEvent read GetOnEdtMouseUp
      write SetOnEdtMouseUp;
    property OnEdtMouseMove: TMouseMoveEvent read GetOnEdtMouseMove
      write SetOnEdtMouseMove;
    //����� ��������
    //�������� ����� ��� ����� ������������ ��������
    property DefNumberValue: Extended read FDefNumberValue
      write SetDefNumberValue;
    property CheckOnExit: Boolean read FCheckOnExit write FCheckOnExit
      default True;
    //������ (�������� "��") ��������� ����� "���������� ��������"
    //�������� Text
    property Sufix: string read FSufix write SetSufix;
    //����������� �������� ���� ������������� "���������� ��������
    //�������� Text
    property Precision: Byte read FPrecision write SetPrecision default 2;
    //��� ����������/���������� "���������� ��������" �������� Text
    property Step: Extended read FStep write FStep;
    //����. � �����. �������� "���������� ��������" �������� Text
    property Min: Extended read FMin write FMin;
    property Max: Extended read FMax write FMax;
    //��������� (�����/�������) ���������� FUpDown
    //������������ ���������� FEdit
    property UpDownPosition: TUpDownPosition read FUpDownPosition write
      SetUpDownPosition;
    //����������� ������������� ������ Up � Down ��� ��������
    //"���������� ��������" �������� Text
    property ArrowKeys: Boolean read FArrowKeys write FArrowKeys default True;
  end;{TFloatSpinEdit}

procedure Register;

implementation

const
  MAX_SUFIX_LENGTH: Byte = 20;
  MAX_CHARDIGCAUNT: Byte = 64;

procedure Register;
begin
  RegisterComponents('DGW', [TFloatSpinEdit]);
end;{Register}


{------------------------------------------------------------------------------}
{--                                TFloatEdit                                --}
{------------------------------------------------------------------------------}

constructor TFloatEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //������������� �����
  FirstClik:= True;
  //������������� �������
  MaxLength:= MAX_SUFIX_LENGTH+MAX_CHARDIGCAUNT+1;
  Text:= '0';
end;{Create}

procedure TFloatEdit.KeyPress(var Key: Char);
begin
  if not(Key in['0'..'9',#8,FormatSettings.DecimalSeparator,'-','e','E']) then
  begin
    Key:= #0;
    MessageBeep(0);
  end;{if not(Key in['0'..'9',#8,DecimalSeparator,'-','e','E']) then}
  inherited KeyPress(Key);
end;{KeyPress}

procedure TFloatEdit.Click;
begin
  if FirstClik and AutoSelect then
  begin
    SelectAll;
    FirstClik:= False;
  end;{FirstClik}
  inherited Click;
end;{Click}

procedure TFloatSpinEdit.FEditDoExitPrepProc;
begin
  if CheckOnExit then FEdit.Text:= GetCorrectText;
end;{FEditDoExitPrepProc}

procedure TFloatEdit.DoExit;
begin
  FirstClik:= True;
  DoExitPrepProc;
  inherited DoExit;
end;{Exit}

procedure TFloatSpinEdit.FEditKeyDownPrepProc
  (var Key: Word; Shift: TShiftState);
begin
  if ArrowKeys then
    case Key of
      VK_UP:
      begin
        FUpDown.Perform(WM_LBUTTONDOWN, MK_LBUTTON, MakeLong(1, 1));
        FUpDown.Perform(WM_LBUTTONUP, 0, MakeLong(1, 1));
      end;{VK_UP:}
      VK_DOWN:
      begin
        FUpDown.Perform(WM_LBUTTONDOWN, MK_LBUTTON,
          MakeLong(1, FUpDown.Height-1));
        FUpDown.Perform(WM_LBUTTONUP, 0,
          MakeLong(1, FUpDown.Height-1));
      end;{VK_UP:}
  end;{if ArrowKeys then}
end;{KeyDown}

procedure TFloatEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  KeyDownPrepProc(Key, Shift);
  inherited KeyDown(Key, Shift);
end;{KeyDown}

{------------------------------------------------------------------------------}
{--                                  FUpDown                                 --}
{------------------------------------------------------------------------------}

procedure TFloatSpinEdit.FUpDownChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: SmallInt;
      Direction: TUpDownDirection);
var
  EdtVal: Extended;
  FormatStr: string;
begin
  {$IFOPT R-}
  {$DEFINE NEEDROFF}
  {$R+}
  {$ENDIF}
  AllowChange:= False;
  EdtVal:= DefNumberValue;
  FormatStr:= '%.'+IntToStr(Precision)+'f '+FSufix;
  try
    if Direction=updUp then
      EdtVal:= StrToFloat(CutSufixStr(FEdit.Text))+FStep;
    if Direction=updDown then
      EdtVal:= StrToFloat(CutSufixStr(FEdit.Text))-FStep;
  except
    on EOverflow do EdtVal:= FDefNumberValue;
    on EConvertError do EdtVal:= FDefNumberValue;
  end;{try ... except ...}
  if EdtVal>FMax then EdtVal:= FMax;
  if EdtVal<FMin then EdtVal:= FMin;
  FEdit.Text:= Format(FormatStr, [EdtVal]);
  {$IFDEF NEEDROFF}
  {$R-}
  {$UNDEF NEEDROFF}
  {$ENDIF}
end;{FUpDownOnChangingEx}

{------------------------------------------------------------------------------}
{--                              TFloatSpinEdit                              --}
{------------------------------------------------------------------------------}

constructor TFloatSpinEdit.Create(AOwner: TComponent);
var
  TmpWidth, TmpHeight: SmallInt;
begin
  inherited Create(AOwner);
  //��������� �������� ������� �� ���������
  FUpDownPosition:= udpRight;
  FCheckOnExit:= True;
  FDefNumberValue:= 0;
  FArrowKeys:= True;
  FStep:= 0.25;
  FPrecision:= 2;
  FMin:= -100;
  FMax:= 100;
  //FEdit
  FEdit:= TFloatEdit.Create(Self);
  FEdit.Parent:= Self;
  FEdit.Anchors:= [];
  FEdit.AutoSize:= False;
  FEdit.KeyDownPrepProc:= FEditKeyDownPrepProc;
  FEdit.DoExitPrepProc:= FEditDoExitPrepProc;
  //FUpDown
  FUpDown:= TUpDown.Create(Self);
  FUpDown.Parent:= Self;
  FUpDown.Anchors:= [];
  FUpDown.Min:= -100;
  FUpDown.OnChangingEx:= FUpDownChangingEx;
  //������������� � ����������������� ��������
  FEdit.Height:= 24;
  TmpWidth:= FEdit.Width+FUpDown.Width;
  TmpHeight:= FEdit.Height+1;
  SetBounds(Left, Top, TmpWidth, TmpHeight);
end;{Create}

destructor TFloatSpinEdit.Destroy;
begin
  FUpDown.Free;
  FEdit.Free;
  inherited Destroy;
end;{Destroy}

procedure TFloatSpinEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  TmpLeft, TmpHeight: SmallInt;
begin
  TmpLeft:= 0;
  if Assigned(FEdit) then TmpHeight:= FEdit.Height+1 else
    TmpHeight:= AHeight;
  inherited SetBounds(ALeft, ATop, AWidth, TmpHeight);
  if Assigned(FEdit) then
  begin
    case FUpDownPosition of
      udpRight: TmpLeft:= 0;
      udpLeft:  TmpLeft:= FUpDown.Width;
    end;{case FUpDownPosition of}
    FEdit.SetBounds(TmpLeft, 0, AWidth-FUpDown.Width, TmpHeight-1);
  end;{if Assigned(FEdit) then}
  if Assigned(FUpDown) then
  begin
    case FUpDownPosition of
      udpRight: TmpLeft:= FEdit.Width;
      udpLeft:  TmpLeft:= 0;
    end;{case FUpDownPosition of}
    FUpDown.SetBounds(TmpLeft, 0, FUpDown.Width, TmpHeight-1);
  end;{if Assigned(FUpDown) then}
end;{SetBounds}

//������ ������/��������� �������

procedure TFloatSpinEdit.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(Value);
  if Assigned(FEdit) then FEdit.Enabled:= Value;
  if Assigned(FUpDown) then FUpDown.Enabled:= Value;
end;

function TFloatSpinEdit.GetText: string;
begin
  Result:= FEdit.Text;
end;{GetText}

procedure TFloatSpinEdit.SetText(Value: string);
begin
  FEdit.Text:= Value;
end;{SetText}

procedure TFloatSpinEdit.SetDefNumberValue(Value: Extended);
begin
  if Value<>FDefNumberValue then
  begin
    FDefNumberValue:= Value;
    if (FDefNumberValue>FMax) or (FDefNumberValue<FMax) then
      FDefNumberValue:= 0;
  end;{if Value<>FDefNumberValue then}
end;{SetDefNumberValue}

function TFloatSpinEdit.GetNumberValue: Extended;
begin
  {$IFOPT R-}
  {$DEFINE NEEDROFF}
  {$R+}
  {$ENDIF}
  try
    Result:= StrToFloat(Text);
  except
    on EOverflow do Result:= FDefNumberValue;
    on EConvertError do Result:= FDefNumberValue;
  end;{try ... except}
  {$IFDEF NEEDROFF}
  {$R-}
  {$UNDEF NEEDROFF}
  {$ENDIF}
end;{GetNumberValue}

procedure TFloatSpinEdit.SetNumberValue(Value: Extended);
var
  FormatStr: String;
begin
  FNumberValue:= Value;
  if Value>FMax then FNumberValue:= FMax;
  if Value<FMin then FNumberValue:= FMin;
  FormatStr:= '%.'+IntToStr(FPrecision)+'f '+Sufix;
  Text:= Format(FormatStr, [FNumberValue]);
end;{SetNumberValue}

function TFloatSpinEdit.GetFont: TFont;
begin
  Result:= FEdit.Font;
end;{GetFont}

procedure TFloatSpinEdit.SetFont(Value: TFont);
begin
  if Value<>FEdit.Font then
  begin
    FEdit.Font:= Value;
    SetBounds(Left, Top, Width, Height);
  end;{if Value<>FEdit.Font then}
end;{SetFont}

function TFloatSpinEdit.GetColor: TColor;
begin
  Result:= FEdit.Color;
end;{GetColor}

procedure TFloatSpinEdit.SetColor(Value: TColor);
begin
  FEdit.Color:= Value;
end;{SetColor}

function TFloatSpinEdit.GetAutoSelect: Boolean;
begin
  Result:= FEdit.AutoSelect;
end;{GetAutoSelect}

procedure TFloatSpinEdit.SetAutoSelect(Value: Boolean);
begin
  FEdit.AutoSelect:= Value;
end;{SetAutoSelect}

function TFloatSpinEdit.GetAutoSize: Boolean;
begin
  Result:= FEdit.AutoSize;
end;{GetAutoSize}

procedure TFloatSpinEdit.SetAutosize(Value: Boolean);
begin
  if Value<>FEdit.AutoSize then
  begin
    FEdit.AutoSize:= Value;
    SetBounds(Left, Top, Width, Height);
  end;{if Value<>FEdit.AutoSize then}
end;{SetAutosize}

procedure TFloatSpinEdit.SetUpDownPosition(Value: TUpDownPosition);
begin
  if Value<>FUpDownPosition then
  begin
    FUpDownPosition:= Value;
    SetBounds(Left, Top, Width, Height);
  end;{if Value<>UpDownPosition then}
end;{SetUpDownPosition}

procedure TFloatSpinEdit.SetSufix(Value: string);
begin
  FSufix:= Value;
  if Length(FSufix)>MAX_SUFIX_LENGTH then SetLength(FSufix, MAX_SUFIX_LENGTH);
  Text:= CutSufixStr(Text)+' '+FSufix;
end;{SetSufix}

procedure TFloatSpinEdit.SetPrecision(Value: Byte);
begin
  if Value<=15 then FPrecision:= Value else FPrecision:= 15;
  FEdit.Text:= GetCorrectText;
end;{SetPrecision}

//������ ������/������ �������

function TFloatSpinEdit.GetOnEdtChange: TNotifyEvent;
begin
  Result:= FEdit.OnChange;
end;{GetOnEdtChange}

procedure TFloatSpinEdit.SetOnEdtChange(Value: TNotifyEvent);
begin
  FEdit.OnChange:= Value;
end;{SetOnEdtChange}

function TFloatSpinEdit.GetOnEdtClick: TNotifyEvent;
begin
  Result:= FEdit.OnClick;
end;{GetOnEdtClick}

procedure TFloatSpinEdit.SetOnEdtClick(Value: TNotifyEvent);
begin
  FEdit.OnClick:= Value;
end;{SetOnEdtClick}

function TFloatSpinEdit.GetOnEdtDblClick: TNotifyEvent;
begin
  Result:= FEdit.OnDblClick;
end;{GetOnEdtDblClick}

procedure TFloatSpinEdit.SetOnEdtDblClick(Value: TNotifyEvent);
begin
  FEdit.OnDblClick:= Value;
end;{SetOnEdtDblClick}

function TFloatSpinEdit.GetOnEdtEnter: TNotifyEvent;
begin
  Result:= FEdit.OnEnter;
end;{GetOnEdtEnter}

procedure TFloatSpinEdit.SetOnEdtEnter(Value: TNotifyEvent);
begin
  FEdit.OnEnter := Value;
end;{SetOnEdtEnter}

function TFloatSpinEdit.GetOnEdtExit: TNotifyEvent;
begin
  Result:= FEdit.OnExit;
end;{GetOnEdtExit}

procedure TFloatSpinEdit.SetOnEdtExit(Value: TNotifyEvent);
begin
  FEdit.OnExit:= Value;
end;{SetOnEdtExit}

function TFloatSpinEdit.GetOnEdtKeyDown: TKeyEvent;
begin
  Result:= FEdit.OnKeyDown;
end;{GetOnEdtKeyDown}

procedure TFloatSpinEdit.SetOnEdtKeyDown(Value: TKeyEvent);
begin
  FEdit.OnKeyDown:= Value;
end;{SetOnEdtKeyDown}

function TFloatSpinEdit.GetOnEdtKeyUp: TKeyEvent;
begin
  Result:= FEdit.OnKeyUp;
end;{GetOnEdtKeyUp}

procedure TFloatSpinEdit.SetOnEdtKeyUp(Value: TKeyEvent);
begin
  FEdit.OnKeyUp:= Value;
end;{SetOnEdtKeyUp}

function TFloatSpinEdit.GetOnEdtKeyPress: TKeyPressEvent;
begin
  Result:= FEdit.OnKeyPress;
end;{GetOnEdtKeyPress}

procedure TFloatSpinEdit.SetOnEdtKeyPress(Value: TKeyPressEvent);
begin
  FEdit.OnKeyPress:= Value;
end;{SetOnEdtKeyPress}

function TFloatSpinEdit.GetOnEdtMouseDown: TMouseEvent;
begin
  Result:= FEdit.OnMouseDown;
end;{GetOnEdtMouseDown}

procedure TFloatSpinEdit.SetOnEdtMouseDown(Value: TMouseEvent);
begin
  FEdit.OnMouseDown:= Value;
end;{SetOnEdtMouseDown}

function TFloatSpinEdit.GetOnEdtMouseUp: TMouseEvent;
begin
  Result:= FEdit.OnMouseUp;
end;{GetOnEdtMouseUp}

procedure TFloatSpinEdit.SetOnEdtMouseUp(Value: TMouseEvent);
begin
  FEdit.OnMouseUp:= Value;
end;{SetOnEdtMouseUp}

function TFloatSpinEdit.GetOnEdtMouseMove: TMouseMoveEvent;
begin
  Result:= FEdit.OnMouseMove;
end;{GetOnEdtMouseMove}

procedure TFloatSpinEdit.SetOnEdtMouseMove(Value: TMouseMoveEvent);
begin
  FEdit.OnMouseMove:= Value;
end;{SetOnEdtMouseMove}

//-----

function TFloatSpinEdit.GetCorrectText: string;
var
  FormatStr: string;
  EdtVal: Extended;
begin
  {$IFOPT R-}
  {$DEFINE NEEDROFF}
  {$R+}
  {$ENDIF}
  FormatStr:= '%.'+IntToStr(FPrecision)+'f '+FSufix;
  try
    EdtVal:= StrToFloat(CutSufixStr(FEdit.Text));
  except
    on EOverflow do EdtVal:= FDefNumberValue;
    on EConvertError do EdtVal:= FDefNumberValue;
  end;{try ... except ...}
  if EdtVal>FMax then EdtVal:= FMax;
  if EdtVal<FMin then EdtVal:= FMin;
  Result:= Format(FormatStr, [EdtVal]);
  {$IFDEF NEEDROFF}
  {$R-}
  {$UNDEF NEEDROFF}
  {$ENDIF}
end;{GetCorrectText}

class function TFloatSpinEdit.CutSufixStr(InStr: string): string;
var
  L, i, L_d: SmallInt;
  TrimStr: string;
begin
  TrimStr:= Trim(InStr);
  L:= Length(TrimStr);
  L_d:= 0;
  if L>0 then
  begin
    for i:= 1 to L do
    begin
      if TrimStr[i] = ' ' then Break;
      Inc(L_d);
    end;
    if L_d>0 then
      SetLength(TrimStr, L_d)
    else
      TrimStr:= '0';
  end
  else
    TrimStr:= '0';
  Result:= TrimStr;
end;{CutSmStr}

function TFloatSpinEdit.DefineValue(var Value: Extended): Boolean;
var
  EdtVal: Extended;
begin
  {$IFOPT R-}
  {$DEFINE NEEDROFF}
  {$R+}
  {$ENDIF}
  Result:= True;
  try
    EdtVal:= StrToFloat(CutSufixStr(FEdit.Text));
  except
    on EOverflow do
    begin
      Result:= False;
      Exit;
    end;{on EOverflow do}
    on EConvertError do
    begin
      Result:= False;
      Exit;
    end;{on EConvertError do}
  end;{try ... except ...}
  if (EdtVal>FMax) or (EdtVal<FMin) then
  begin
    Result:= False;
    Exit;
  end;{if (EdtVal>Max) or (EdtVal<Min) then}
  Value:= EdtVal;
  {$IFDEF NEEDROFF}
  {$R-}
  {$UNDEF NEEDROFF}
  {$ENDIF}
end;{DefineValue}

end.



