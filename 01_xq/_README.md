check → carga la base de datos xml
run → ejecuta la consulta

xquery /personas/persona/nombre/text() → ejecuta en en basex la consulta

basex -i "nombre .xq" → ejecuta la consulta en powershell

basex -i -q 00_xq/01_consulta.xq → se ejecuta una consulta en powershell
basex -i 00_xq/datos.xml -Q 00_xq/02_consulta.xq → se ejecuta una consulta

basex -i 00_xq/datos.xml xquery "/personas/persona/nombre/text()" → ejecuta la consulta pero segunda forma
basex -q "doc('00_xq/datos.xml')/personas/persona/nombre/text()" → ejecuta la consulta de la tercera forma


[Console]::OutputEncoding = [Text.Encoding]::UTF8 → condgio para powershell lo lea como utf8