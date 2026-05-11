declare option output:indent "yes";

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
return ($indice, $id, $tanqueNew, $qrNew, $mida)