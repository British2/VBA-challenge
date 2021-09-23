
    Dim OpenM As Double
    Dim CloseN As Double
    Dim Ticker As String
    Dim RowCounter As Integer
    Dim YrChange As Double
    Dim PercentChange As Double
    Dim StockVolume As Double
    Dim LastRow As Double
    Dim WorksheetName As String
    
 'Loop Through All Sheets
    Dim WorksheetCount As Integer
    WorksheetCount = ActiveWorkbook.Worksheets.Count
    For ws = 1 To WorksheetCount
    Worksheets(ws).Select
    OpenM = Cells(2, 3).Value
    StockVolume = 0
    RowCounter = 2
    LastRow = Cells(Rows.Count, 1).End(xlUp).Row - 1
'Loop and Calcs
    For i = 2 To LastRow
    
        If Cells(i + 1, 1) <> Cells(i, 1) Then
'Ticker Symbol
            Ticker = Cells(i, 1)
            Cells(RowCounter, 9) = Ticker
'Calc of Price Change & Color
        
            CloseN = Cells(i, 6).Value
            YrChange = CloseN - OpenM
            Cells(RowCounter, 10) = YrChange
            If YrChange < 0 Then
                Cells(RowCounter, 10).Interior.ColorIndex = 3
            Else
                Cells(RowCounter, 10).Interior.ColorIndex = 4
            End If
            
            
' Header Names
            Cells(1, 9).Value = "Ticker"
            Cells(1, 10).Value = "Yearly Change"
            Cells(1, 11).Value = "Percent Change"
            Cells(1, 12).Value = "Total Stock Volume"
            
'Change to a Percent
            If OpenM = 0 Then
                PercentChange = 0
                Cells(RowCounter, 11) = PercentChange
                Cells(RowCounter, 11).NumberFormat = "0.00%"
            Else
                PercentChange = YrChange / OpenM
                Cells(RowCounter, 11) = PercentChange
                Cells(RowCounter, 11).NumberFormat = "0.00%"
            End If
'Final Stock Volume
            OpenM = Cells(i + 1, 3).Value
            Cells(RowCounter, 12) = StockVolume
            StockVolume = Cells(i + 1, 7).Value
            RowCounter = RowCounter + 1
'Not a New Ticker Symbol
        Else
            StockVolume = StockVolume + Cells(i + 1, 7).Value
        
        End If
    
    Next i
    
    Next ws