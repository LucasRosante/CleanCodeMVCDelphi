object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Usu'#225'rios'
  ClientHeight = 277
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 661
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object SearchBox1: TSearchBox
      AlignWithMargins = True
      Left = 243
      Top = 17
      Width = 408
      Height = 27
      Margins.Top = 17
      Margins.Right = 10
      Margins.Bottom = 6
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnInvokeSearch = SearchBox1InvokeSearch
    end
    object RadioGroup1: TRadioGroup
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 227
      Height = 44
      Margins.Left = 10
      Align = alLeft
      Caption = 'Tipo de pesquisa'
      Columns = 4
      Items.Strings = (
        'ID'
        'Usu'#225'rio'
        'Email'
        'Senha')
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 59
    Width = 661
    Height = 110
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 641
      Height = 104
      Margins.Left = 10
      Margins.Right = 10
      Align = alClient
      BorderStyle = bsNone
      Options = [dgTitles, dgIndicator, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'GUUID'
          Title.Caption = 'ID'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USER_NAME'
          Title.Caption = 'Usu'#225'rio'
          Width = 135
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Title.Caption = 'Email'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PASSWORD'
          Title.Caption = 'Senha'
          Width = 120
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 240
    Width = 654
    Height = 34
    Margins.Right = 10
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object btnDelete: TButton
      AlignWithMargins = True
      Left = 399
      Top = 3
      Width = 80
      Height = 28
      Align = alRight
      Caption = 'Delete'
      TabOrder = 0
      OnClick = btnDeleteClick
    end
    object btnAll: TButton
      AlignWithMargins = True
      Left = 318
      Top = 3
      Width = 75
      Height = 28
      Align = alRight
      Caption = 'All'
      TabOrder = 1
      OnClick = btnAllClick
    end
    object btnInsert: TButton
      AlignWithMargins = True
      Left = 485
      Top = 3
      Width = 80
      Height = 28
      Align = alRight
      Caption = 'Insert'
      TabOrder = 2
      OnClick = btnInsertClick
    end
    object btnUpdate: TButton
      AlignWithMargins = True
      Left = 571
      Top = 3
      Width = 80
      Height = 28
      Align = alRight
      Caption = 'Update'
      TabOrder = 3
      OnClick = btnUpdateClick
    end
  end
  object Panel4: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 175
    Width = 661
    Height = 58
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 13
      Top = 3
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label5: TLabel
      Left = 239
      Top = 3
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label6: TLabel
      Left = 374
      Top = 3
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object Label7: TLabel
      Left = 515
      Top = 3
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object edtID: TEdit
      Left = 13
      Top = 22
      Width = 220
      Height = 21
      MaxLength = 36
      TabOrder = 0
    end
    object edtUserName: TEdit
      Left = 239
      Top = 22
      Width = 129
      Height = 21
      MaxLength = 20
      TabOrder = 1
    end
    object edtEmail: TEdit
      Left = 374
      Top = 22
      Width = 135
      Height = 21
      MaxLength = 100
      TabOrder = 2
    end
    object edtPassword: TEdit
      Left = 515
      Top = 22
      Width = 135
      Height = 21
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 3
    end
  end
end
