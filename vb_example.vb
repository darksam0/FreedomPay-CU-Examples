Imports RestSharp

' Written by Scott Ross
' Spring 2015 
' Demonstrates connecting to FreedomPay HPP using json
' This example is written in VB with RestSharp.  nuget install-package RestSharp

Module Main

    Sub Main()
        Dim client = New RestClient()
        client.BaseUrl = New Uri("************")
        Dim request = New RestRequest("createTransaction", Method.POST)
        request.RequestFormat = DataFormat.Json

        Dim StoreId = "*********"
        Dim TerminalId = "*************"
        Dim bodyAsJson = "{""StoreId"": """ + StoreId + """,""TerminalId"": """ + TerminalId + """,""TransactionTotal"": 50,""IsAuthCapture"": false,""InvoiceItems"": [],""PurchaseItems"": []}"

        request.AddParameter("application/json", bodyAsJson, ParameterType.RequestBody)

        Console.WriteLine(client.Execute(request).Content)
        Console.ReadLine()
    End Sub

End Module
