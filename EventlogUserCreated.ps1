$CreatedUsers=get-eventlog -Log Security -before $(get-date)|where {$_.EventID -eq 4720}


if($CreatedUsers.Length -eq 0){
    #Keine Benutzeranlagen gefunden
    Write-Host "0 EventLogBenutzerAnlage count=0;1;1;0 Keine Benutzeranlage im Eventlog gefunden"
        
}else{
    #Es wurden Benutzeranlagen gefunden
    for( $i=0;$i -le $CreatedUsers.Length;$i++){
        $EventTime+=$CreatedUsers[$i].TimeGenerated.DateTime.toString()
        if($i -lt $CreatedUsers.Length-1){
            $EventTime+=", "
        }
    }
    Write-Host "0 EventLogBenutzerAnlage count=$($CreatedUsers.Length);1;1;0 Es wurden Benutzeranlage im Eventlog gefunden ID(4720)"+" ( $($EventTime) )"
}