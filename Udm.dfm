object dm: Tdm
  Left = 0
  Top = 0
  Caption = 'dm'
  ClientHeight = 313
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FDConnection1: TFDConnection
    Params.Strings = (
      'OSAuthent=Yes'
      'Database=REPARATIE_DEVICE'
      'Server=COMPUTER'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object QLiber: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sector')
    Left = 112
    Top = 16
  end
  object QLogare: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from LUCRATOR '
      'where LOGIN = :LOGIN and PASSWORD = :PASSWORD')
    Left = 160
    Top = 16
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASSWORD'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object QLiber2: TFDQuery
    Connection = FDConnection1
    Left = 112
    Top = 72
  end
  object DSQLiber: TDataSource
    DataSet = QLiber
    Left = 168
    Top = 72
  end
  object DSQRequest: TDataSource
    DataSet = QRequest
    Left = 320
    Top = 248
  end
  object QRequest: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select ROW_NUMBER() over(order by c.gestionat asc) as nr, c.*,  '
      'c.nume + '#39' '#39' + c.prenume as npp,'
      'f.nume + '#39' '#39' + m.nume as model_telefon,'
      's.nume as sector,'
      'p.problema as problema'
      'from client c '
      'inner join sector s on '
      's.sector_id = c.sector_id'
      'inner join problema p on'
      'p.problema_id = c.problema_id'
      'inner join model m on '
      'm.model_id = c.model_id'
      'inner join firma f on'
      'f.firma_id = m.firma_id'
      '--where gestionat != 2'
      'order by gestionat, data_request, c.client_id DESC')
    Left = 320
    Top = 208
  end
  object TFrima: TFDTable
    Active = True
    IndexFieldNames = 'FIRMA_ID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'REPARATIE_DEVICE.dbo.FIRMA'
    TableName = 'REPARATIE_DEVICE.dbo.FIRMA'
    Left = 320
    Top = 112
  end
  object DSTFirma: TDataSource
    DataSet = TFrima
    Left = 320
    Top = 152
  end
  object TModel: TFDTable
    Active = True
    IndexFieldNames = 'FIRMA_ID'
    MasterSource = DSTFirma
    MasterFields = 'FIRMA_ID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'REPARATIE_DEVICE.dbo.MODEL'
    TableName = 'REPARATIE_DEVICE.dbo.MODEL'
    Left = 272
    Top = 112
  end
  object DSTModel: TDataSource
    DataSet = TModel
    Left = 272
    Top = 160
  end
  object TOper: TFDTable
    Active = True
    IndexFieldNames = 'LUCRATOR_ID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'REPARATIE_DEVICE.dbo.LUCRATOR'
    TableName = 'REPARATIE_DEVICE.dbo.LUCRATOR'
    Left = 32
    Top = 192
    object TOperLUCRATOR_ID: TFDAutoIncField
      FieldName = 'LUCRATOR_ID'
      Origin = 'LUCRATOR_ID'
      ReadOnly = True
    end
    object TOperNUME: TStringField
      FieldName = 'NUME'
      Origin = 'NUME'
      Size = 30
    end
    object TOperPRENUME: TStringField
      FieldName = 'PRENUME'
      Origin = 'PRENUME'
      Size = 30
    end
    object TOperLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 30
    end
    object TOperPASSWORD: TStringField
      FieldName = 'PASSWORD'
      Origin = 'PASSWORD'
      Size = 30
    end
    object TOperTIP_ACCES: TIntegerField
      FieldName = 'TIP_ACCES'
      Origin = 'TIP_ACCES'
    end
  end
  object DSTOper: TDataSource
    DataSet = TOper
    Left = 32
    Top = 240
  end
  object DSTProblema: TDataSource
    DataSet = TProblema
    Left = 112
    Top = 240
  end
  object TProblema: TFDTable
    Active = True
    IndexFieldNames = 'PROBLEMA_ID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'REPARATIE_DEVICE.dbo.PROBLEMA'
    TableName = 'REPARATIE_DEVICE.dbo.PROBLEMA'
    Left = 112
    Top = 192
  end
  object QRaportDevice: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select m.MODEL_ID, count(*) as Cant,'
      'ROW_NUMBER() over(order by f.NUME + '#39' '#39' + m.NUME DESC) as nr,'
      'f.NUME + '#39' '#39' + m.NUME as ModelTelefon'
      'from CLIENT c'
      'inner join MODEL m'
      'on m.MODEL_ID = c.MODEL_ID'
      'inner join FIRMA f'
      'on f.FIRMA_ID = m.FIRMA_ID'
      'group by m.MODEL_ID, f.NUME + '#39' '#39' + m.NUME'
      'order by COUNT(m.MODEL_ID) desc')
    Left = 344
    Top = 16
  end
  object frxReport1: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44001.572730798600000000
    ReportOptions.LastChange = 44001.572730798600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 416
    Top = 16
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Width = 763.465060000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -37
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Cele Mai Solicitate Device-uri')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 79.370130000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 115.086688500000000000
          Top = 15.118120000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'nr')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Align = baCenter
          Left = 236.031648500000000000
          Top = 15.118120000000000000
          Width = 268.346630000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Model Telefon')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 504.378278500000000000
          Top = 15.118120000000000000
          Width = 147.401670000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Cantitate')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 740.409927000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 115.086688500000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."nr"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Align = baCenter
          Left = 236.031648500000000000
          Width = 268.346630000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."ModelTelefon"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 504.378278500000000000
          Width = 147.401670000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."Cant"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 260.787570000000000000
        Width = 740.409927000000000000
        object Memo10: TfrxMemoView
          Width = 744.567410000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Pagina [Page]/[TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QRaportDevice
    BCDToCurrency = False
    Left = 416
    Top = 64
  end
  object QRaportProb: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select c.PROBLEMA_ID, count(*) as Cant,'
      'ROW_NUMBER() over(order by count(*) DESC) as nr,'
      'p.PROBLEMA as Problema'
      'from CLIENT c'
      'inner join PROBLEMA p'
      'on p.PROBLEMA_ID = c.PROBLEMA_ID'
      'group by c.PROBLEMA_ID, p.PROBLEMA'
      'order by COUNT(p.PROBLEMA_ID) desc')
    Left = 392
    Top = 120
  end
  object frxReport2: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44001.572730798600000000
    ReportOptions.LastChange = 44001.690670127320000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 456
    Top = 120
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Width = 763.465060000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -37
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Cele Mai Des Probleme'
            '')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 79.370130000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 115.086688500000000000
          Top = 15.118120000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'nr')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Align = baCenter
          Left = 236.031648500000000000
          Top = 15.118120000000000000
          Width = 268.346630000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Problema')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 504.378278500000000000
          Top = 15.118120000000000000
          Width = 147.401670000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Cantitate')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 740.409927000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 115.086688500000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."nr"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Align = baCenter
          Left = 236.031648500000000000
          Width = 268.346630000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."Problema"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 504.378278500000000000
          Width = 147.401670000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."Cant"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 260.787570000000000000
        Width = 740.409927000000000000
        object Memo10: TfrxMemoView
          Width = 744.567410000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Pagina [Page]/[TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = QRaportProb
    BCDToCurrency = False
    Left = 456
    Top = 168
  end
end
