# Tips and Tricks

## Remove all vagrant boxes from your machine

These commands will remove all cached copies of all vagrant boxes on your machine.  Afterward when you run vagrant up, they will be re-downloaded.

Powershell

```Powershell
vagrant box list | %{$_.split(' ')[0]} | get-unique | foreach {vagrant box remove $_ --all}
```

Bash

```Bash
vagrant box list | cut -f 1 -d ' ' | xargs -L 1 vagrant box remove -f
```
