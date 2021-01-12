'MMain.module client side--------------------------
' Gambas module file

Public n As String
Public nn As String
Public iii As Integer
Public Sub Main()
  n = ""
  iii = 0
  If Args.Count < 2 Then Quit
  MMains(Args[1], "")
  While (iii <> 1)
    Line Input nn
    MMains(Args[1], "/" & n & "," & nn)
  Wend
    
End

Public Sub MMains(ss1 As String, ss2 As String)
  Dim sep As String[]
  Dim s2 As String 
  Dim s1 As String 
  Dim s As Socket
  Dim ii As Integer
  Dim i As Integer
  Dim ss As String
  Dim sss As String
  Dim ssss As String
  s = New Socket
  ss = ss1
  ssss = ss2
  sss = "8080"
  i = Val(sss)

  ss = Replace(ss, "localhost", "127.0.0.1")
  ss = Replace(ss, "LOCALHOST", "127.0.0.1")
  ss = Replace(ss, "HTTP:", "")
  ss = Replace(ss, "http:", "")
  ss = Replace(ss, "//", "")
  s.Connect(ss, i)
  Do While (s.Status <> 7) And (s.Status > 0)
    Wait 0.1
  Loop
  sss = "GET /" & ssss & " HTTP/1.0\r\n"   
  If s.Status <> 7 Then 
    Print "error"
    Quit
  Endif
  s2 = sss
  Write #s, s2, Len(s2)
  Do While Lof(s) = 0
    Wait 0.1
  Loop
  Read #s, sss, Lof(s)
  Close s
  sep = Split(sss, ",")
  iii = Val(Trim(sep[1]))
  n = Trim(sep[0])
  Print Trim(sep[2])
  End
