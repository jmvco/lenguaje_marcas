declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "xml";
declare option output:indent "yes";

<calculos>
{
for $registro at $indice in doc("peces.xml")/peces/row
let $id := string($registro/id)
let $tanque := string($registro/tanque)
let $qr := string($registro/qr)
let $mida := string($registro/mida)
let $tanqueNew :=

    if ($tanque != "") then substring($tanque, 1, 3)
    else if ($tanque = "") then "R12."
    else ""

let $qrNew :=
    if (contains($qr, "5")) then concat("5_", $qr)
    else if (not(contains($qr, "5"))) then concat($qr, "_not")
    else ""
    
where xs:integer($mida) <= 615
order by $mida
return

  <registro>
   <iterador>{ $indice}</iterador>
   <id>{ $id}</id>
   <tanque>{ $tanqueNew}</tanque>
   <qr>{ $qrNew}</qr>
   <medicion clave="media" valor="{ $mida}"/>
  </registro>
}
</calculos>