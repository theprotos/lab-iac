function base64 {
  # enumerate all pipeline input
  $input |ForEach-Object {
    if($MyInvocation.UnboundArguments -contains '--decode'){
      # caller supplied `--decode`, so decode
      $bytes = [convert]::FromBase64String($_)
      [System.Text.Encoding]::ASCII.GetString($bytes)
    } else {
      # default mode, encode ascii text as base64
      $bytes = [System.Text.Encoding]::ASCII.GetBytes($_)
      [convert]::ToBase64String($bytes)
    }
  }
}